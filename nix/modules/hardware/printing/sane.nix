{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      hardware.sane.enable = lib.mkIf cfg.enable true;
    };}
