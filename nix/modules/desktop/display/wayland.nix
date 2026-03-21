{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.xwayland.enable = lib.mkIf cfg.enable true;
    };}
