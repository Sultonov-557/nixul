{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.khal = lib.mkIf cfg.enable {
        enable = true;
      };
    };}
