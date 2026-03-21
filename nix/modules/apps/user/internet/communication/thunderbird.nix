{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.thunderbird = lib.mkIf cfg.enable {
        enable = true;
      };
    };}
