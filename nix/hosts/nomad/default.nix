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
    "eDP-1,1920x1080@60,0x0,1"
  ];

  nixul.host = {
    name = "nomad";
    timezone = "Asia/Tashkent";
    location = "Urganch";
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
          "services/containers/docker"
        ])
        {
          core.security.access.fail2ban.enable = true;
          services.monitoring.dashy.enable = false;
          apps.gaming.compatibility.proton.enable = false;
          apps.media.photo.aseprite.enable = false;
          apps.user.internet.communication.thunderbird.enable = false;
          apps.user.productivity.todoist.enable = false;
        };
  };
}
