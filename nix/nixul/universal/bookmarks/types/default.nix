{ lib, ... }:
let
  bookmarkType = import ./bookmark-type.nix { inherit lib; };
  groupBookmarkType = import ./group-bookmark-type.nix { inherit lib bookmarkType; };
in
{
  inherit bookmarkType groupBookmarkType;
}
