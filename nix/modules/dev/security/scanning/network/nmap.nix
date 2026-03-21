{ pkgs, lib, ... }:
{
  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (
        with pkgs;
        [
          nmap
          zenmap
        ]
      );
    };}
