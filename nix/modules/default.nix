{ lib, ... }:
let
  importTree = import ../lib/import-tree.nix { inherit lib; };
in
{
  imports = builtins.concatMap importTree [
    ./apps
    ./core
    ./desktop
    ./dev
    ./hardware
    ./services
  ];
}
