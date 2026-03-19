{
  loadTags,
  loadTheme,
  lib,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../users/example
    (loadTheme "gruvbox-material")
  ];

  nixul.host = {
    name = "example";
    timezone = "UTC";
    location = "The Moon";

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
          "compositor/niri"
          "display-manager/gdm"
          "display-manager/sddm"
          "services/containers/docker"
          "services/monitoring/dashy"
          "hardware/units/storage/udiskie"
        ])
        {
          core.maintenance.garbage-collector.enable = true;
          core.security.ssh.ssh.enable = true;
        };
  };
}
