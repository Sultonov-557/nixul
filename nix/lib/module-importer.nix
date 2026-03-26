{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  modulesRoot = ../modules;

  utils = import ./module-importer/utils.nix { inherit lib; };
  types = import ./module-importer/types.nix { inherit lib; };
  loader = import ./module-importer/module-loader.nix {
    inherit
      lib
      pkgs
      inputs
      config
      ;
  };

  discovery = import ./module-importer/discover.nix {
    inherit lib modulesRoot;
    inherit (utils)
      dirEntryFile
      isNixFile
      sanitizeParts
      ;
    loadModule = loader.loadModule;
  };

  optionTrees = import ./module-importer/options.nix {
    inherit lib;
    inherit (discovery) hostMods userMods;
    inherit (utils)
      mkNested
      mergeAll
      ;
    inherit (types) mkCfgOption;
  };

  metadataTrees = import ./module-importer/metadata.nix {
    inherit lib;
    inherit (discovery)
      discovered
      hostMods
      userMods
      ;
    inherit (utils)
      mkNested
      mergeAll
      ;
  };

  host = import ./module-importer/host.nix {
    inherit
      lib
      pkgs
      config
      inputs
      ;
    inherit (discovery) hostMods;
    inherit (optionTrees) hostOptions;
    inherit (utils) getByPathOrNull;
    inherit (types) assertCfgType;
  };

  users = import ./module-importer/users.nix {
    inherit
      lib
      pkgs
      config
      inputs
      ;
    inherit (discovery) userMods;
    inherit (optionTrees) userOptions;
    inherit (utils) getByPathOrNull;
    inherit (types) assertCfgType;
  };

  mkPathTree =
    modules:
    lib.foldl' (
      acc: module: lib.recursiveUpdate acc (lib.setAttrByPath module.pathParts { __module = true; })
    ) { } modules;

  collectUnknownPaths =
    {
      configured,
      knownTree,
      path ? [ ],
    }:
    if !(builtins.isAttrs configured) then
      [ ]
    else
      lib.concatMap (
        name:
        let
          value = builtins.getAttr name configured;
          nextPath = path ++ [ name ];
        in
        if !(builtins.hasAttr name knownTree) then
          [ nextPath ]
        else
          let
            node = builtins.getAttr name knownTree;
          in
          if builtins.isAttrs value && !(node ? __module) then
            collectUnknownPaths {
              configured = value;
              knownTree = node;
              path = nextPath;
            }
          else
            [ ]
      ) (builtins.attrNames configured);

  pathToString = path: lib.concatStringsSep "." path;

  hasPathInTree =
    path: tree:
    if path == [ ] then
      true
    else
      let
        key = builtins.head path;
        rest = builtins.tail path;
      in
      if !(builtins.hasAttr key tree) then
        false
      else if rest == [ ] then
        true
      else
        hasPathInTree rest (builtins.getAttr key tree);

  allKnownTree = mkPathTree discovery.discovered;
  hostKnownTree = mkPathTree discovery.hostMods;
  userKnownTree = mkPathTree discovery.userMods;

  hostInvalidPathsRaw = collectUnknownPaths {
    configured = lib.attrByPath [ "nixul" "host" "modules" ] { } config;
    knownTree = hostKnownTree;
  };

  userInvalidPathsRaw =
    let
      usersCfg = lib.attrByPath [ "nixul" "users" ] { } config;
      userNames = builtins.attrNames usersCfg;
    in
    lib.concatMap (
      user:
      let
        userCfg = builtins.getAttr user usersCfg;
      in
      map (
        path: {
          inherit user path;
        }
      ) (collectUnknownPaths {
        configured = userCfg.modules or { };
        knownTree = userKnownTree;
      })
    ) userNames;

  hostUnknownPathsRaw = builtins.filter (path: !(hasPathInTree path allKnownTree)) hostInvalidPathsRaw;
  hostWrongScopePathsRaw = builtins.filter (path: hasPathInTree path allKnownTree) hostInvalidPathsRaw;

  userUnknownPathsRaw = builtins.filter (item: !(hasPathInTree item.path allKnownTree)) userInvalidPathsRaw;
  userWrongScopePathsRaw = builtins.filter (item: hasPathInTree item.path allKnownTree) userInvalidPathsRaw;

  hostUnknownModulePaths = map (path: "nixul.host.modules." + pathToString path) hostUnknownPathsRaw;
  hostWrongScopeModulePaths = map (path: "nixul.host.modules." + pathToString path) hostWrongScopePathsRaw;

  userUnknownModulePaths = map (item: "nixul.users.${item.user}.modules." + pathToString item.path) userUnknownPathsRaw;
  userWrongScopeModulePaths = map (item: "nixul.users.${item.user}.modules." + pathToString item.path) userWrongScopePathsRaw;

  unknownModulePaths = hostUnknownModulePaths ++ userUnknownModulePaths;
  wrongScopeModulePaths = hostWrongScopeModulePaths ++ userWrongScopeModulePaths;
  invalidModulePaths = unknownModulePaths ++ wrongScopeModulePaths;

  mkList = xs: lib.concatMapStringsSep "\n" (path: "  - " + path) xs;

  unknownModulesMessage =
    let
      unknownSection =
        if unknownModulePaths == [ ] then
          ""
        else
          ''
            The following option paths are set, but no module exists at those paths:
            ${mkList unknownModulePaths}
          '';
      wrongScopeSection =
        if wrongScopeModulePaths == [ ] then
          ""
        else
          ''
            The following option paths point to real modules, but in the wrong scope (host vs user):
            ${mkList wrongScopeModulePaths}
          '';
    in
    ''
      nixul module importer: invalid module option paths detected

      ${unknownSection}
      ${wrongScopeSection}
    '';

in
{
  imports = host.hostImports;
  options = {
    nixul._systemModuleOptions = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      internal = true;
      description = "Auto-generated system module options tree (internal).";

    };

    nixul._userModuleOptions = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      internal = true;
      description = "Auto-generated per-user module options tree (internal).";
    };

    nixul._moduleMetadata = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      internal = true;
      description = "Auto-generated metadata tree for all discovered modules (internal).";
    };

    nixul._hostModuleMetadata = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      internal = true;
      description = "Auto-generated metadata tree for system-capable modules (internal).";
    };

    nixul._userModuleMetadata = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      internal = true;
      description = "Auto-generated metadata tree for home-capable modules (internal).";
    };
  };

  config = lib.mkMerge [
    {
      home-manager.users = users.homeMerged;
    }
    {
      nixul._userModuleOptions = optionTrees.userOptions;
      nixul._systemModuleOptions = optionTrees.hostOptions;
      nixul._moduleMetadata = metadataTrees.allModuleMetadata;
      nixul._hostModuleMetadata = metadataTrees.hostModuleMetadata;
      nixul._userModuleMetadata = metadataTrees.userModuleMetadata;
      assertions = [
        {
          assertion = invalidModulePaths == [ ];
          message = unknownModulesMessage;
        }
      ];
      warnings = [
        ("nixul importer discovered: " + (toString (builtins.length discovery.discovered)) + " modules")
      ];
    }
  ];
}
