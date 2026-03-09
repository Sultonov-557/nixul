{ lib, ... }:
let
  themesRoot = ../nixul/themes;

  loadTheme =
    name:
    {
      config,
      lib,
      pkgs,
      inputs,
      ...
    }:
    let
      p = themesRoot + "/${name}.nix";
      theme =
        if builtins.pathExists p then
          import p
        else
          throw "nixul: unknown theme '${name}' (expected ${toString p})";
    in
    {
      # System part
      imports = [
        (theme.system {
          inherit
            lib
            pkgs
            config
            inputs
            ;
        })
      ];

      # Home part for main user
      home-manager.sharedModules = [
        (theme.home {
          inherit
            lib
            pkgs
            config
            inputs
            ;
        })
      ];
    };
in
{
  inherit loadTheme;
}
