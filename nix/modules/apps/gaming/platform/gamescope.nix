{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.gamescope.enable = lib.mkIf cfg.enable true;
    };}
