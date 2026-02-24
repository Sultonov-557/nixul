{ lib, ... }:

let
  types = import ./types;
in
{
  imports = [
  ];

  options.nixul.bookmarks = lib.mkOption {
    type = lib.types.attrsOf types.bookmarkGroupType;
    default = { };
    description = "Universal Bookmarks (semantic actions + per-target escape hatches).";
  };
}
