{ lib, ... }:

let
  helpers = import ./helpers.nix { inherit lib; };
  hyprCommands = import ./commands.nix {
    inherit lib;
    inherit (helpers) requireArg;
  };
  mkLines = import ./lines.nix {
    inherit lib hyprCommands;
    inherit (helpers) normalizeKeys;
  };
  mkSettings = import ./settings.nix {
    inherit lib mkLines;
    inherit (helpers) bindGroup;
  };
in
{
  inherit mkSettings;
}
