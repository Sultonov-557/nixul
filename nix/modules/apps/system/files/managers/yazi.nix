{ lib, pkgs, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.yazi.enable = lib.mkIf cfg.enable true;
      home.packages = lib.mkIf cfg.enable (
        with pkgs;
        [
          yazi
          ueberzugpp
        ]
      );
    };}
