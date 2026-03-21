{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.power-profiles-daemon.enable = lib.mkIf cfg.enable true;
    };}
