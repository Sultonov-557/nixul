{
  loadTags,
  loadTheme,
  lib,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../users/sultonov
    (loadTheme "gruvbox-material")
  ];

  home-manager.users.sultonov.wayland.windowManager.hyprland.settings.monitor = [
    "DP-1,1920x1080@100.00,1920x0,1"
    "HDMI-A-1,1920x1080@60.00,0x0,1"
  ];

  nixul.host = {
    name = "sentinel";
    timezone = "Asia/Tashkent";
    location = "Tashkent";
    bookmarks = import ./bookmarks.nix;

    modules =
      lib.recursiveUpdate
        (loadTags [
          "core"
          "services"
          "desktop"
          "compositor/hyprland"
          "display-manager/sddm"
          "hardware"
          "apps"
          "development"
          "services/containers/docker"
        ])
        {
        };
  };
}
