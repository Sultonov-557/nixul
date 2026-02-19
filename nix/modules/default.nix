{ lib, config, ... }:

let
  moduleScan = import ../lib/module-scan.nix { inherit lib; };
  buildOptions = import ../lib/module-options.nix { inherit lib; };
  buildStates = import ../lib/module-states.nix { inherit lib config; };
  buildOutputs = import ../lib/module-outputs.nix { inherit lib config; };

  moduleOptions = buildOptions moduleScan;
  states = buildStates moduleScan;
  outputs = buildOutputs states;

  autoImports = map (module: module.path) moduleScan.autoModules;
in
{
  imports = moduleScan.regularModuleImports ++ autoImports;

  options.nixul.modules = moduleOptions;

  config = lib.mkMerge (
    [
      { assertions = outputs.scopeAssertions; }
    ]
    ++ lib.optional (outputs.homeConfigs != { }) {
      home-manager.users = lib.mapAttrs (_: lib.mkMerge) outputs.homeConfigs;
    }
    ++ outputs.systemConfigs
  );
}
