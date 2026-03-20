{ ... }:
{
  home-manager.users.sultonov = {
    imports = [
      ../../home-manager/users/sultonov
    ];

    wayland.windowManager.hyprland.settings.monitor = [
      "DP-1,1920x1080@60,0x0,1"
      "HDMI-A-1,1280x1024@60,1920x0,1"
    ];
  };
}
