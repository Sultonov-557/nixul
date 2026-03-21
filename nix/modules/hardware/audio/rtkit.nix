{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      security.rtkit.enable = lib.mkIf cfg.enable true;
    };}
