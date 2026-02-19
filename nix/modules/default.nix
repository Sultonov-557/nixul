args@{ lib, config, ... }:
let
  importTree = import ../lib/import-tree.nix { inherit lib; };
  trees = [
    { dir = ./apps; }
    { dir = ./core; }
    { dir = ./desktop; }
    { dir = ./dev; }
    { dir = ./hardware; }
    { dir = ./services; }
  ];

  baseDir = ./.;

  collect =
    dir:
    let
      entries = builtins.readDir dir;
    in
    lib.concatMap
      (name:
        let
          kind = entries.${name};
          path = dir + "/${name}";
        in
        if kind == "directory" then collect path else if kind == "regular" && lib.hasSuffix ".nix" name && name != "default.nix" then [ path ] else [ ]
      )
      (builtins.attrNames entries);

  featurePaths = if builtins.pathExists baseDir then collect baseDir else [ ];

  mkFeature =
    path:
    let
      evaluation = builtins.tryEval (import path);
    in
    if (!evaluation.success) || (!builtins.isAttrs evaluation.value) || (! (evaluation.value ? meta)) then
      null
    else
      let
        relative = lib.removeSuffix ".nix" (lib.removePrefix "${toString baseDir}/" (toString path));
        segments = lib.splitString "/" relative;
        definition = evaluation.value;
        meta = definition.meta or { };
        scope = meta.scope or "both";
        hasHome = meta.hm or (definition ? home);
        hasSystem = meta.system or (definition ? system);
      in
      {
        key = lib.concatStringsSep "." segments;
        inherit segments definition scope hasHome hasSystem;
      };

  features = lib.sort (a: b: a.key < b.key) (lib.filter (v: v != null) (map mkFeature featurePaths));

  mkFeatureOption = lib.mkOption {
    type = lib.types.nullOr lib.types.attrs;
    default = null;
  };

  hostOptions =
    lib.foldl'
      (opts: feature: lib.setAttrByPath ([ "nixul" "modules" ] ++ feature.segments) mkFeatureOption opts)
      { }
      features;

  userOptions =
    lib.foldl'
      (opts: feature: lib.setAttrByPath ([ "nixul" "users" "modules" ] ++ feature.segments) mkFeatureOption opts)
      { }
      features;

  enabledUsers = lib.filterAttrs (_: u: u.enabled or false) (config.nixul.users or { });

  states =
    map
      (feature:
      let
        hostCfg = lib.attrByPath ([ "nixul" "modules" ] ++ feature.segments) null config;
        userCfgs =
          lib.filterAttrs
            (_: userCfg: lib.attrByPath ([ "modules" ] ++ feature.segments) null userCfg != null)
            enabledUsers;
        userFeatureCfgs = lib.mapAttrs (_: userCfg: lib.attrByPath ([ "modules" ] ++ feature.segments) null userCfg) userCfgs;
        hostRequested = hostCfg != null;
        userRequested = userFeatureCfgs != { };
        enabled = hostRequested || userRequested;
        systemCfgParts = lib.optional hostRequested hostCfg ++ lib.attrValues userFeatureCfgs;
        systemCfg = if systemCfgParts == [ ] then { } else lib.mkMerge systemCfgParts;
      in
      {
        inherit feature hostCfg userCfgs userFeatureCfgs hostRequested userRequested enabled systemCfg;
      })
      features;

  systemFragments =
    lib.concatMap
      (state:
        lib.optional (state.feature.hasSystem && state.enabled) (
          state.feature.definition.system (args // { cfg = state.systemCfg; })
        )
      )
      states;

  homeFragments =
    lib.foldl'
      (acc: state:
        if !state.feature.hasHome then acc else
        lib.foldlAttrs
          (inner: userName: userCfg:
            inner
            // {
              ${userName} = (inner.${userName} or [ ]) ++ [
                state.feature.definition.home (
                  args
                  // {
                    userName = userName;
                    userCfg = userCfg;
                    cfg = state.userFeatureCfgs.${userName};
                  }
                )
              ];
            }
          )
          acc
          state.userCfgs
      )
      { }
      states;

  assertions =
    lib.concatMap
      (state:
      let
        scope = state.feature.scope;
        name = state.feature.key;
      in
      lib.optional (scope == "user" && state.hostRequested) {
        assertion = false;
        message = "Feature " + name + " is user scoped; nixul.modules." + name + " must stay null";
      } ++ lib.optional (scope == "host" && state.userRequested) {
        assertion = false;
        message = "Feature " + name + " is host scoped; nixul.users.<name>.modules." + name + " must stay null";
      })
      states;
in
{
  imports = builtins.concatMap importTree trees;

  options = hostOptions;

  config =
    lib.mkMerge (
      [
        { inherit assertions; }
      ]
      ++ lib.optional (homeFragments != { }) {
        home-manager.users = lib.mapAttrs (_: fragments: lib.mkMerge fragments) homeFragments;
      }
      ++ systemFragments
    );
}
