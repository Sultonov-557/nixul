{ lib }:

{ moduleDefs, autoModules ? [ ], ... }:

let
  mkSystemModule =
    moduleDef: args@{ inputs ? { }, ... }:
    let
      def = if builtins.isFunction moduleDef.definition then moduleDef.definition args else moduleDef.definition;
      sys = if def ? system then def.system else null;
    in
    if sys == null then null else {
      imports = [
        (if builtins.isFunction sys then sys (args // { inputs = inputs; }) else sys)
      ];
    };

  systemModules = lib.filter (m: m != null) (map mkSystemModule moduleDefs);

  autoImports = map (module: module.path) autoModules;
in
{
  inherit systemModules autoImports;
  homeModules = [ ];
  assertionsModule = { };
}
