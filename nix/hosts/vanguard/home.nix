{ osConfig, ... }:

{

  home.username = osConfig.nixul.user;
  home.stateVersion = "25.11";

  # Host-specific monitor configurations
  wayland.windowManager.hyprland.settings.monitor = [
    "DP-1,1920x1080@60,0x0,1"
    "HDMI-A-1,1280x1024@60,1920x0,1"
  ];

  programs.niri.settings.outputs = {
    "DP-1" = {
      mode = {
        height = 1080;
        refresh = 60.0;
        width = 1920;
      };
      position = {
        x = 0;
        y = 0;
      };
    };
    "HDMI-A-1" = {
      mode = {
        height = 1024;
        refresh = 60.02;
        width = 1280;
      };
      position = {
        x = 1920;
        y = 0;
      };
    };
  };
}
