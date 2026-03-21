{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      system.autoUpgrade = lib.mkIf cfg.enable {
        enable = true;
        dates = "daily";
        upgrade = true;
      };
    };}
