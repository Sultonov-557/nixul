{ lib, config, ... }:
let
  adapter = import ../../../../nixul/universal/keybinds/adapters/hyprland;
in
{
  system =
    { cfg, ... }:
    {
      programs.hyprland.enable = lib.mkIf cfg.enable true;
      services.displayManager.dms-greeter.compositor.name = lib.mkIf cfg.enable "hyprland";
    };

  home =
    { cfg, user, ... }:
    {
      imports = [ ./settings.nix ];
      wayland.windowManager.hyprland = lib.mkIf cfg.enable {
        enable = true;
        xwayland.enable = true;
        systemd.enable = true;
        settings = adapter.mkSettings config.nixul.users.${user}.keybinds;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable hyprland";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
