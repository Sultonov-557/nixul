{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.udisks2.enable = lib.mkIf cfg.enable true;
      services.devmon.enable = lib.mkIf cfg.enable true;
      services.gvfs.enable = lib.mkIf cfg.enable true;
    };}
