{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.blueman.enable = lib.mkIf cfg.enable true;
    };}
