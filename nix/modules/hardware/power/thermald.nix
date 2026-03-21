{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.thermald.enable = lib.mkIf cfg.enable true;
    };}
