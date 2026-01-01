{ config, osConfig, ... }:

{
  imports = [
    ../../global/home
  ];

  home.username = osConfig.nixul.user;

  wayland.windowManager.hyprland.settings.monitor = [
    "eDP-1,1920x1080@60,0x0,1"
  ];

  # Host-specific monitor configurations
  # wayland.windowManager.hyprland.settings.monitor = [ ... ];
  # modules.desktop.wms.niri.settings.outputs."eDP-1" = { ... };
}
