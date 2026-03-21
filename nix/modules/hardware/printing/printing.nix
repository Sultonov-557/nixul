{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.printing.enable = lib.mkIf cfg.enable true;
    };}
