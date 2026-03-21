{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.gamemode.enable = lib.mkIf cfg.enable true;
    };}
