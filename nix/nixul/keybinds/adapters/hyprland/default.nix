{ lib, config, ... }:

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

  enabledUsers = lib.filterAttrs (_: u: u.enable or false) config.nixul.users;

  desktopUsers = lib.filterAttrs (_: u: lib.elem "desktop" (u.tags or [ ])) enabledUsers;

  hostBinds = config.nixul.host.keybinds or [ ];

  mkUserHM = u: {
    wayland.windowManager.hyprland.settings = mkSettings ((u.keybinds or [ ]) ++ hostBinds);
  };
in
{
  home-manager.users = lib.mapAttrs mkUserHM desktopUsers;
}
