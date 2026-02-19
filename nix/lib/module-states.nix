{ lib, config }:

{ moduleDefs, ... }:

let
  enabledUsers = { };

  computeModuleState =
    moduleDef:
    let
      hostCfg = lib.attrByPath (
        [
          "nixul"
          "modules"
        ]
        ++ moduleDef.segments
      ) null config;

      usersWithModule = lib.filterAttrs (
        _: userCfg: lib.attrByPath ([ "modules" ] ++ moduleDef.segments) null userCfg != null
      ) enabledUsers;

      userModuleCfgs = lib.mapAttrs (
        _: userCfg: lib.attrByPath ([ "modules" ] ++ moduleDef.segments) null userCfg
      ) usersWithModule;

      hostRequested = hostCfg != null;
      userRequested = userModuleCfgs != { };
      enabled = hostRequested || userRequested;

      systemCfgParts = lib.optional hostRequested hostCfg ++ lib.attrValues userModuleCfgs;
      systemCfg = if systemCfgParts == [ ] then { } else lib.mkMerge systemCfgParts;
    in
    {
      inherit moduleDef hostCfg userModuleCfgs hostRequested userRequested enabled systemCfg;
    };

  moduleStates = map computeModuleState moduleDefs;
in
{
  inherit moduleStates;
}
