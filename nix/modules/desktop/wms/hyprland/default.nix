{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.hyprland.enable = lib.mkIf cfg.enable true;
      services.displayManager.dms-greeter.compositor.name = lib.mkIf cfg.enable "hyprland";
    };

  home =
    { cfg, ... }:
    {
      imports = [ ./settings.nix ];
      wayland.windowManager.hyprland = lib.mkIf cfg.enable {
        enable = true;
        xwayland.enable = true;
        systemd.enable = true;
        settings = {
          monitor = [ "eDP-1,1920x1080@60,0x0,1" ];
        };
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
