{ ... }:
{
  imports = [
    ../../../hosts/vanguard/hardware-configuration.nix
    ../../common/context.nix
    ../../common/static-system-modules.nix
  ];

  nixul.host = {
    name = "vanguard";
    timezone = "Asia/Tashkent";
    location = "Tashkent";
    bookmarks =
      let
        raw = import ../../../hosts/vanguard/bookmarks.nix;
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
      "DP-1,1920x1080@60,0x0,1"
      "HDMI-A-1,1280x1024@60,1920x0,1"
    ];
  };
}
