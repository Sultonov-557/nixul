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

  enabledUsers = lib.filterAttrs (_: u: u.enable or false) config.nixul.users;

  desktopUsers = lib.filterAttrs (_: u: lib.elem "desktop" (u.tags or [ ])) enabledUsers;

  hostBinds = config.nixul.host.keybinds or [ ];

  mkUserHM = user: {
    programs.niri.settings.binds = mkSettings ((user.keybinds or [ ]) ++ hostBinds);
  };
in
{
  home-manager.users = lib.mapAttrs mkUserHM desktopUsers;
}
