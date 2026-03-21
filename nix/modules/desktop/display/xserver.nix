{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.xserver.enable = lib.mkIf cfg.enable true;
    };}
