{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      hardware.bluetooth = lib.mkIf cfg.enable {
        enable = true;
        powerOnBoot = true;
      };
    };}
