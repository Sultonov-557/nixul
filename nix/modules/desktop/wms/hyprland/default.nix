{ lib, config, ... }:
let
  adapter = import ../../../lib/keybinds-hyprland.nix { inherit lib; };
in
{
  system =
    { cfg, ... }:
    {
      programs.hyprland.enable = lib.mkIf cfg.enable true;
      services.displayManager.dms-greeter.compositor.name = lib.mkIf cfg.enable "hyprland";
    };

  home =
    { cfg, user, nixul, ... }:
    {
      imports = [ ./settings.nix ];
      wayland.windowManager.hyprland = lib.mkIf cfg.enable {
        enable = true;
        xwayland.enable = true;
        systemd.enable = true;
        settings = adapter.mkSettings nixul.users.${user}.keybinds;
      };
    };
}
