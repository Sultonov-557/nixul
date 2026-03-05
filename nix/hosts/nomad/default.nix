{ loadTags, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../users/sultonov
  ];

  nixul.host = {
    name = "nomad";
    timezone = "Asia/Tashkent";
    bookmarks = import ./bookmarks.nix;

    modules = lib.recursiveUpdate (loadTags [
      "base"
      "bluetooth"
      "network"
      "wayland"
      "laptop"
      "audio"
      "compositor/hyprland"
      "display-manager/gdm"
    ]) { };
  };
}
