{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.upower.enable = lib.mkIf cfg.enable true;
    };}
