{ lib, config, ... }:

let
  helpers = import ./helpers.nix { inherit lib; };

  niriAvailable = config.lib ? niri;

  mkBinding = import ./binding.nix {
    inherit lib;
    actions = if niriAvailable then config.lib.niri.actions else { };
    inherit (helpers) requireArg spawnCommand;
  };

  mkSettings = import ./settings.nix {
    inherit lib mkBinding;
    inherit (helpers) normalizeKeys formatCombo;
  };
in
{
  home-manager.users.${config.nixul.user} = lib.mkIf niriAvailable {
    programs.niri.settings.binds = mkSettings config.nixul.keybinds;
  };
}
