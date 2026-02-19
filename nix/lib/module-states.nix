{ lib, config }:

{ moduleDefs, ... }:

let
  enabledUsers = config.nixul.users or { };

  computeModuleState =
    moduleDef:
    let
      hostCfg = lib.attrByPath (
        [ "nixul" ] ++ moduleDef.segments
      ) null config;

      usersWithModule = lib.filterAttrs (
        _: userCfg: lib.attrByPath ([ "modules" ] ++ moduleDef.segments) null userCfg != null
      ) enabledUsers;

      userModuleCfgs = lib.mapAttrs (
        _: userCfg:
        let
          value = lib.attrByPath ([ "modules" ] ++ moduleDef.segments) null userCfg;
        in
        if value == true then { } else value
      ) usersWithModule;

      hostRequested = hostCfg != null && hostCfg != false;
      userRequested = userModuleCfgs != { };
      enabled = hostRequested || userRequested;

      systemCfgParts =
        lib.optional hostRequested (
          if builtins.isAttrs hostCfg then hostCfg else if hostCfg == true then { } else { }
        )
        ++ lib.filter (v: v != null) (lib.attrValues userModuleCfgs);
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
