{ lib, ... }:
let
  importTree = import ../lib/import-tree.nix { inherit lib; };
in
{
  imports = builtins.concatMap importTree [
    {
      dir = ./apps;
      prefix = [ "apps" ];
    }
    {
      dir = ./core;
      prefix = [ "core" ];
    }
    {
      dir = ./desktop;
      prefix = [ "desktop" ];
    }
    {
      dir = ./dev;
      prefix = [ "dev" ];
    }
    {
      dir = ./hardware;
      prefix = [ "hardware" ];
    }
    {
      dir = ./services;
      prefix = [ "services" ];
    }
  ];
}
