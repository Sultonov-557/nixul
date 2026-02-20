{ lib, config, pkgs, ... }:

let
  moduleScan = import ../lib/module-scan.nix { inherit lib; };
  buildOptions = import ../lib/module-options.nix { inherit lib; };
  buildStates = import ../lib/module-states.nix { inherit lib config; };
  buildOutputs = import ../lib/module-outputs.nix { inherit lib config pkgs; };

  moduleOptions = buildOptions moduleScan;
  states = buildStates moduleScan;
  outputs = buildOutputs states;
in
{
  imports = moduleScan.regularModuleImports ++ outputs.autoImports;

  options.nixul = moduleOptions;

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
