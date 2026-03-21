{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.bat = lib.mkIf cfg.enable {
        enable = true;
      };
    };}
