{ lib, ... }:

let
  importTree = import ../lib/import-tree.nix { inherit lib; };
  moduleDirs = [
    ./apps
    ./core
    ./desktop
    ./dev
    ./hardware
    ./services
  ];
  moduleFiles = builtins.concatMap importTree moduleDirs;

  makeModule =
    path:
    args@{ inputs ? { }, lib, ... }:
    let
      raw = import path;
      definition = if builtins.isFunction raw then raw args else raw;
      sys = if definition ? system then definition.system else null;
    in
    {
      imports = lib.optional (sys != null) sys;
    };

  systemModules = map makeModule moduleFiles;
in
{
  imports = systemModules;
}
