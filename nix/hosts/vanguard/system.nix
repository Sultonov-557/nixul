{ ... }:
{
  imports = [
    ../../nixos/common/context.nix
    ../../nixos/common/static-system-modules.nix
  ];

  nixul.host = {
    name = "vanguard";
    timezone = "Asia/Tashkent";
    location = "Tashkent";
    bookmarks =
      let
        raw = import ./bookmarks.nix;
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
}
