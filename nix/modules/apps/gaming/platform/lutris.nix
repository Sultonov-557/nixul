{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.lutris.enable = lib.mkIf cfg.enable true;
    };}
