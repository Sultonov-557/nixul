{ lib, config, ... }:
let
  # ============================================================================
  # STEP 1: DISCOVER ALL MODULE FILES
  # ============================================================================
  # import-tree.nix recursively finds all .nix files in the given directories
  importTree = import ../lib/import-tree.nix { inherit lib; };

  # Directories containing our modules (uncomment as needed)
  moduleDirs = [
    ./apps
    ./core
    ./desktop
    ./dev
    ./hardware
    ./services
  ];

  # Flat list of all .nix file paths from all module directories
  allModuleFiles = builtins.concatMap importTree moduleDirs;

  pathSegments =
    path:
    let
      relativePath = lib.removeSuffix ".nix" (lib.removePrefix "${toString ./.}/" (toString path));
    in
    lib.splitString "/" relativePath;

  # ============================================================================
  # STEP 2: IDENTIFY MODULE DEFINITIONS (files with `meta` attribute)
  # ============================================================================
  # A "module definition" is a file that exports a `meta` attribute.
  # These are special modules that need option generation and config wiring.
  isModuleDefinition =
    path:
    let
      result = builtins.tryEval (import path);
    in
    # Skip this file itself
    path != toString ./default.nix
    # Import must succeed
    && result.success
    # Must be an attribute set
    && builtins.isAttrs result.value
    # Must have a `meta` attribute marking it as a module definition
    && result.value ? meta;

  moduleDefPaths = builtins.filter isModuleDefinition allModuleFiles;

  # ============================================================================
  # STEP 3: PARSE EACH MODULE DEFINITION INTO USABLE DATA
  # ============================================================================
  # Convert each path into a structured record with all needed info
  parseModuleDef =
    path:
    let
      # Convert path like "./apps/ai/codex.nix" to ["apps" "ai" "codex"]
      segments = pathSegments path;

      # Import the actual module
      definition = import path;
      meta = definition.meta or { };

      # Where can this module be enabled? "host", "user", or "both"
      scope = meta.scope or "both";

      # Does this module define system-level config?
      hasSystem = meta.system or (definition ? system);

      # Does this module define home-manager config?
      hasHome = meta.hm or (definition ? home);

      # Dot-separated key like "apps.ai.codex" for error messages
      key = lib.concatStringsSep "." segments;
    in
    {
      inherit
        path
        segments
        definition
        scope
        hasSystem
        hasHome
        key
        ;
    };

  moduleDefs = map parseModuleDef moduleDefPaths;

  # ============================================================================
  # STEP 4: IDENTIFY MODULES WITHOUT META
  # ============================================================================
  autoModulePaths = builtins.filter (p: !builtins.elem p moduleDefPaths) allModuleFiles;

  parseAutoModule =
    path:
    let
      segments = pathSegments path;
      key = lib.concatStringsSep "." segments;
    in
    {
      inherit path segments key;
    };

  autoModules = map parseAutoModule autoModulePaths;

  # ============================================================================
  # STEP 5: GENERATE OPTIONS UNDER nixul.modules.*
  # ============================================================================
  # Each module definition gets an option at nixul.modules.<category>.<name>
  # Example: nixul.modules.apps.ai.codex
  moduleDefinitionOption = lib.mkOption {
    type = lib.types.nullOr lib.types.attrs;
    default = null;
  };

  # Build nested attribute set of options from segment paths
  moduleDefinitionOptions = lib.foldl' (
    opts: moduleDef: lib.recursiveUpdate opts (lib.setAttrByPath moduleDef.segments moduleDefinitionOption)
  ) { } moduleDefs;

  autoModuleOption = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  autoModuleOptions = lib.foldl' (
    opts: moduleDef: lib.recursiveUpdate opts (lib.setAttrByPath moduleDef.segments autoModuleOption)
  ) { } autoModules;

  moduleOptions = lib.recursiveUpdate moduleDefinitionOptions autoModuleOptions;

  # ============================================================================
  # STEP 6: REGULAR MODULE IMPORTS (skip module definitions)
  # ============================================================================
  # Regular modules (without `meta`) are just imported directly.
  # Module definitions are handled separately via the option system.
  regularModuleImports = builtins.filter (
    p: !(builtins.elem p moduleDefPaths) && !(builtins.elem p autoModulePaths)
  ) allModuleFiles;

  # ============================================================================
  # STEP 7: COMPUTE ENABLED STATE FOR EACH MODULE
  # ============================================================================
  # Find all enabled users (users with enabled = true)
  #enabledUsers = lib.filterAttrs (_: u: u.enabled or false) (config.nixul.users or { });
  enabledUsers = { };

  # For each module definition, determine if it's enabled and collect configs
  computeModuleState =
    moduleDef:
    let
      # Host-level config: nixul.modules.<path>
      hostCfg = lib.attrByPath (
        [
          "nixul"
          "modules"
        ]
        ++ moduleDef.segments
      ) null config;

      # User-level configs: nixul.users.<name>.modules.<path>
      usersWithModule = lib.filterAttrs (
        _: userCfg: lib.attrByPath ([ "modules" ] ++ moduleDef.segments) null userCfg != null
      ) enabledUsers;

      userModuleCfgs = lib.mapAttrs (
        _: userCfg: lib.attrByPath ([ "modules" ] ++ moduleDef.segments) null userCfg
      ) usersWithModule;

      # Is this module requested at host or user level?
      hostRequested = hostCfg != null;
      userRequested = userModuleCfgs != { };
      enabled = hostRequested || userRequested;

      # Merge all config sources for system-level output
      systemCfgParts = lib.optional hostRequested hostCfg ++ lib.attrValues userModuleCfgs;
      systemCfg = if systemCfgParts == [ ] then { } else lib.mkMerge systemCfgParts;
    in
    {
      inherit
        moduleDef
        hostCfg
        userModuleCfgs
        hostRequested
        userRequested
        enabled
        systemCfg
        ;
    };

  moduleStates = map computeModuleState moduleDefs;

  autoModuleStates = map (
    moduleDef:
    {
      inherit moduleDef;
      enabled = lib.attrByPath (
        [
          "nixul"
          "modules"
        ]
        ++ moduleDef.segments
      ) true config;
    }
  ) autoModules;

  # ============================================================================
  # STEP 8: GENERATE SYSTEM CONFIGURATIONS
  # ============================================================================
  # Each enabled module with `system` function contributes to NixOS config
  systemConfigs = lib.concatMap (
    state:
    if state.moduleDef.hasSystem && state.enabled then
      [
        (state.moduleDef.definition.system {
          inherit lib config;
          cfg = state.systemCfg;
        })
      ]
    else
      [ ]
  ) moduleStates;

  # ============================================================================
  # STEP 9: GENERATE HOME-MANAGER CONFIGURATIONS
  # ============================================================================
  # Each enabled module with `home` function contributes to home-manager config
  homeConfigs = lib.foldl' (
    acc: state:
    if !state.moduleDef.hasHome then
      acc
    else
      # For each user who has this module enabled, add their home config
      lib.foldlAttrs (
        inner: userName: _:
        inner
        // {
          ${userName} = (inner.${userName} or [ ]) ++ [
            state.moduleDef.definition.home
            {
              inherit lib config userName;
              userCfg = state.userModuleCfgs.${userName};
              cfg = state.userModuleCfgs.${userName};
            }
          ];
        }
      ) acc state.userModuleCfgs
  ) { } moduleStates;

  # ============================================================================
  # STEP 10: GENERATE ASSERTIONS FOR SCOPE VALIDATION
  # ============================================================================
  # "user" scoped modules can only be enabled per-user
  # "host" scoped modules can only be enabled at host level
  scopeAssertions = lib.concatMap (
    state:
    let
      name = state.moduleDef.key;
    in
    # User-scoped module cannot be enabled at host level
    lib.optional (state.moduleDef.scope == "user" && state.hostRequested) {
      assertion = false;
      message = "Module ${name} is user-scoped; use nixul.users.<name>.modules.${name} instead";
    }
    # Host-scoped module cannot be enabled per-user
    ++ lib.optional (state.moduleDef.scope == "host" && state.userRequested) {
      assertion = false;
      message = "Module ${name} is host-scoped; nixul.users.<name>.modules.${name} must be null";
    }
  ) moduleStates;

in
{
  # Import regular modules (those without `meta`)
  imports =
    regularModuleImports
    ++ lib.concatMap (state: if state.enabled then [ state.moduleDef.path ] else [ ]) autoModuleStates;

  # Generate the nixul.modules.* options
  options.nixul.modules = moduleOptions;

  # Wire up all the configurations
  config = lib.mkMerge (
    [
      { assertions = scopeAssertions; }
    ]
    # Add home-manager configs if any exist
    ++ lib.optional (homeConfigs != { }) {
      home-manager.users = lib.mapAttrs (_: lib.mkMerge) homeConfigs;
    }
    # Add all system configs
    ++ systemConfigs
  );
}
