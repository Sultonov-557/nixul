{ config, osConfig, ... }:

{
  imports = [ ../../global/home ];

  home.username = osConfig.nixul.user;

  # Host-specific monitor configurations
  wayland.windowManager.hyprland.settings.monitor =
    [ "eDP-1,1920x1080@60,0x0,1" ];

  programs.niri.settings.outputs."eDP-1" = {
    mode = {
      height = 1080;
      refresh = 60.0;
      width = 1920;
    };
  };
}
