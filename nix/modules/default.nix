{ lib, ... }:
let
  importTree = import ../lib/import-tree.nix { inherit lib; };
  trees = [
    {
      dir = ./apps;
    }
    {
      dir = ./core;
    }
    {
      dir = ./desktop;
    }
    {
      dir = ./dev;
    }
    {
      dir = ./hardware;
    }
    {
      dir = ./services;
    }
  ];
in
{
  imports = builtins.concatMap importTree trees;
}
