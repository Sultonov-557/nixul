{ ... }:
{
  imports = [
    ../../../hosts/nomad/hardware-configuration.nix
    ../../common/context.nix
    ../../common/static-system-modules.nix
  ];

  nixul.host = {
    name = "nomad";
    timezone = "Asia/Tashkent";
    location = "Urganch";
    bookmarks =
      let
        raw = import ../../../hosts/nomad/bookmarks.nix;
        normalizeItem = item:
          {
            icon = null;
            tags = [ ];
            order = null;
          }
          // item;
        normalizeGroup = group:
          group
          // {
            items = builtins.mapAttrs (_: item: normalizeItem item) group.items;
          };
      in
      builtins.mapAttrs (_: group: normalizeGroup group) raw;
  };

  home-manager.users.sultonov = {
    imports = [
      ../../../home-manager/users/sultonov
    ];

    wayland.windowManager.hyprland.settings.monitor = [
      "eDP-1,1920x1080@60,0x0,1"
    ];
  };
}
