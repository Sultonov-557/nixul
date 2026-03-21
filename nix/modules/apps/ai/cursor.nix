{ lib, ... }:
{

  home =
    { cfg, pkgs, ... }:
    {
      home.packages = lib.mkIf cfg.enable [ pkgs.cursor-cli ];
    };}
