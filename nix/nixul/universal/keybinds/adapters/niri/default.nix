{ lib, ... }:
let
  helpers = import ./helpers.nix { inherit lib; };

  mkBinding = import ./binding.nix {
    inherit lib;
    inherit (helpers) requireArg spawnCommand;
  };

  mkSettings = import ./settings.nix {
    inherit lib mkBinding;
    inherit (helpers) normalizeKeys formatCombo;
  };
in
{
  inherit mkSettings;
}

