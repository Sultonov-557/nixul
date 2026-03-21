{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.eza.enable = lib.mkIf cfg.enable true;
    };}
