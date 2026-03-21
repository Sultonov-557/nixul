{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.steam.enable = lib.mkIf cfg.enable true;
    };}
