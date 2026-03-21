{ lib, pkgs, ... }:
{
  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable [
        pkgs.cliphist
        pkgs.wl-clipboard
      ];

      services.cliphist.enable = lib.mkIf cfg.enable true;
    };}
