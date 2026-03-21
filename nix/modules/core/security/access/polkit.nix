{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      security.polkit.enable = lib.mkIf cfg.enable true;
    };}
