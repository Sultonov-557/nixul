{ ... }:
{
  imports = [
    ../../nixos/common/context.nix
    ../../nixos/common/static-system-modules.nix
  ];

  nixul.host = {
    name = "nomad";
    timezone = "Asia/Tashkent";
    location = "Urganch";
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
