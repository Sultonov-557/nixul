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
    "DP-1,1920x1080@60,0x0,1"
    "HDMI-A-1,1280x1024@60,1920x0,1"
  ];

  nixul.host = {
    name = "vanguard";
    timezone = "Asia/Tashkent";
    location = "Tashkent";
    bookmarks = import ./bookmarks.nix;

    modules =
      lib.recursiveUpdate
        (loadTags [
          "core"
          "services"
          "hardware"
          "apps"
          "development"
          "desktop"
          "compositor/hyprland"
          "display-manager/gdm"
          "display-manager/sddm"
          "services/containers/podman"
        ])
        {
          services.containers.docker.enable = false;
          services.monitoring.dashy.enable = false;
        };
  };
}
