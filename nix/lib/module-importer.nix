{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  t = lib.types;

  modulesRoot = ../modules;

  isNixFile = name: lib.hasSuffix ".nix" name;

  mkNested = path: value: lib.setAttrByPath path value;

  mergeAll = xs: lib.foldl' lib.recursiveUpdate { } xs;

  # Get a nested value from an attrset by path, return null if missing
  getByPathOrNull = path: set: lib.attrByPath path null set;

  # Optional: assert the cfg is either null or attrs (nice errors)
  assertCfgType =
    {
      filePath,
      optName,
      cfg,
    }:
    if cfg == null || builtins.isAttrs cfg then
      cfg
    else
      throw ''
        nixul module importer: option must be null or an attrset

        Option: ${optName}
        File: ${toString filePath}
        Got type: ${builtins.typeOf cfg}
      '';

  mkCfgOption =
    fullName:
    lib.mkOption {
      type = lib.types.nullOr lib.types.attrs;
      default = null;
      description = "Auto-imported nixul module: ${fullName}";
    };

  # Decide which file represents a directory module.
  # default.nix takes priority.
  dirEntryFile =
    dirPath:
    let
      entries = builtins.readDir dirPath;
    in
    if entries ? "default.nix" && entries."default.nix" == "regular" then
      dirPath + "/default.nix"
    else
      null;

  # Build the "module path" from a filesystem path part list.
  # Example: [ "apps" "ai" "codex" ] -> that becomes nixul.modules.apps.ai.codex
  # (We just keep it as list for now.)
  sanitizeParts = parts: parts;

  # Import a module file ONLY to read meta + function presence.
  importModule =
    filePath:
    let
      raw = import filePath;
    in
    if builtins.isFunction raw then raw { inherit lib pkgs inputs; } else raw;

  # Validate the imported contract early so errors point to the real file.
  validateModule =
    filePath: mod:
    let
      meta = mod.meta or null;
      scope = if meta != null then (meta.scope or null) else null;
      hm = if meta != null then (meta.hm or false) else false;
      system = if meta != null then (meta.system or false) else false;

      hasHome = mod ? home;
      hasSystem = mod ? system;

      bad =
        (meta == null)
        || !(scope == "host" || scope == "user")
        || (hm && !hasHome)
        || (system && !hasSystem);
    in
    if bad then
      throw ''
        nixul module importer: invalid module contract

        File: ${toString filePath}

        Expected:
          - returns attrset with `meta = { scope = "host"|"user"; hm = bool; system = bool; }`
          - if meta.hm = true, must provide `home = ...`
          - if meta.system = true, must provide `system = ...`

        Got:
          - meta: ${lib.generators.toPretty { } (meta)}
          - has home: ${toString hasHome}
          - has system: ${toString hasSystem}
      ''
    else
      {
        inherit meta;
        # Keep booleans handy
        hm = hm;
        system = system;
        scope = scope;
      };

  # Recursive walker.
  # Returns a list of entries:
  # { pathParts = [...]; filePath = ...; mod = ...; meta = ...; scope = ...; hm = ...; system = ...; }
  walk =
    dirPath: pathParts:
    let
      entries = builtins.readDir dirPath;

      # If directory has default.nix -> directory is a module entry.
      # We treat it as an entry and DO NOT descend further (simple + deterministic).
      defaultFile = dirEntryFile dirPath;

      mkEntry =
        parts: filePath:
        let
          mod = importModule filePath;
          v = validateModule filePath mod;
        in
        {
          pathParts = sanitizeParts parts;
          inherit filePath mod;
          inherit (v)
            meta
            scope
            hm
            system
            ;
        };

      # If default.nix exists, directory is a module and we stop.
      inDirEntry =
        if defaultFile != null then
          [ (mkEntry pathParts defaultFile) ]
        else
          let
            names = builtins.attrNames entries;

            subdirs = lib.concatMap (
              name:
              if entries.${name} == "directory" then walk (dirPath + "/${name}") (pathParts ++ [ name ]) else [ ]
            ) names;

            nixFiles = lib.concatMap (
              name:
              if entries.${name} == "regular" && isNixFile name then
                # file module: foo.nix -> pathParts ++ ["foo"] (without extension)
                let
                  base = lib.removeSuffix ".nix" name;
                  filePath = dirPath + "/${name}";
                in
                [ (mkEntry (pathParts ++ [ base ]) filePath) ]
              else
                [ ]
            ) names;
          in
          nixFiles ++ subdirs;
    in
    inDirEntry;

  # Start scanning from modulesRoot, but ignore some folders
  discovered =
    let
      rootEntries = builtins.readDir modulesRoot;
      topNames = builtins.attrNames rootEntries;

      scanTop = lib.concatMap (
        name:
        if rootEntries.${name} == "directory" then
          walk (modulesRoot + "/${name}") [ name ]
        else if rootEntries.${name} == "regular" && isNixFile name then
          # top-level foo.nix
          walk modulesRoot [ ] # will pick it up as nixFiles
        else
          [ ]
      ) topNames;
    in
    scanTop;

  hostMods = builtins.filter (m: m.scope == "host" && m.system) discovered;
  userMods = builtins.filter (m: m.scope == "user" && m.hm) discovered;

  hostOptions = mergeAll (
    map (
      m: mkNested m.pathParts (mkCfgOption ("nixul.modules." + (lib.concatStringsSep "." m.pathParts)))
    ) hostMods
  );

  userModuleOptions = mergeAll (
    map (
      m:
      mkNested m.pathParts (
        mkCfgOption ("nixul.users.*.modules." + (lib.concatStringsSep "." m.pathParts))
      )
    ) userMods
  );

  hostModulesToImport = map (
    m:
    let
      optName = "nixul.modules." + lib.concatStringsSep "." m.pathParts;
      cfg0 = getByPathOrNull m.pathParts (hostOptions);
      cfg =
        if cfg0 == null || builtins.isAttrs cfg0 then
          cfg0
        else
          throw "nixul: ${optName} must be null or attrs, got ${builtins.typeOf cfg0}";
    in
    if cfg == null then
      null
    else
      # This returns a NixOS module (attrset), good for imports
      (m.mod.system {
        inherit lib pkgs config;
        cfg = cfg;
      })
  ) hostMods;
  hostImports = builtins.filter (x: x != null) hostModulesToImport;

  hostFragments = map (
    m:
    let
      optName = "nixul.modules." + lib.concatStringsSep "." m.pathParts;
      cfg0 = getByPathOrNull m.pathParts (hostOptions);
      cfg = assertCfgType {
        filePath = m.filePath;
        inherit optName;
        cfg = cfg0;
      };
    in
    if cfg == null then
      { }
    else
      let
        modPath = lib.concatStringsSep "." m.pathParts;
        sysVal = m.mod.system;
        sysType = builtins.typeOf sysVal;

        _ = builtins.trace (
          "nixul importer: calling system for "
          + modPath
          + " | file="
          + toString m.filePath
          + " | systemType="
          + sysType
        ) null;
      in
      if builtins.isFunction sysVal then
        sysVal {
          inherit lib pkgs config;
          cfg = cfg;
        }
      else
        throw ''
          nixul importer: module has meta.system=true but `system` is not a function

          Module: ${modPath}
          File: ${toString m.filePath}
          system type: ${sysType}

          Hint: system must be like: system = { cfg, ... }: { config = ...; };
        ''
  ) hostMods;

  hostMerged = lib.mkMerge hostFragments;
in
{
  imports = hostImports;
  options = {
    nixul._systemModuleOptions = lib.mkOption {
      type = lib.types.attrs; # this is an options-tree (attrset of mkOption), so keep it attrs
      default = { };
      internal = true;
      description = "Auto-generated system module options tree (internal).";

    };

    nixul._userModuleOptions = lib.mkOption {
      type = lib.types.attrs; # this is an options-tree (attrset of mkOption), so keep it attrs
      default = { };
      internal = true;
      description = "Auto-generated per-user module options tree (internal).";
    };
  };

  config = lib.mkMerge [
    # step 6/7
    hostMerged
    {
      nixul._userModuleOptions = userModuleOptions;
      nixul._systemModuleOptions = hostOptions;
      warnings = [
        ("nixul importer discovered: " + (toString (builtins.length discovered)) + " modules")
      ];
    }
  ];
}
