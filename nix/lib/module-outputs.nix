{ lib, config }:

{ moduleStates, autoModules ? [ ], ... }:

let
  systemConfigs = lib.concatMap (
    state:
    if state.moduleDef.hasSystem && state.enabled then
      let
        sys = state.moduleDef.definition.system;
      in
      [
        (
          if builtins.isFunction sys then
            sys (
              {
                inherit lib config;
                cfg = state.systemCfg;
              }
              // placeholder
            )
          else
            sys
        )
      ]
    else
      [ ]
  ) moduleStates;

  homeConfigs = lib.foldl' (
    acc: state:
    if !state.moduleDef.hasHome then
      acc
    else
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

  scopeAssertions = lib.concatMap (
    state:
    let
      name = state.moduleDef.key;
    in
    lib.optional (state.moduleDef.scope == "user" && state.hostRequested) {
      assertion = false;
      message = "Module ${name} is user-scoped; use nixul.users.<name>.modules.${name} instead";
    }
    ++ lib.optional (state.moduleDef.scope == "host" && state.userRequested) {
      assertion = false;
      message = "Module ${name} is host-scoped; nixul.users.<name>.modules.${name} must be null";
    }
  ) moduleStates;

  autoImports = map (module: module.path) autoModules;
in
{
  inherit systemConfigs homeConfigs scopeAssertions autoImports;
}
