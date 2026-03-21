{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      hardware.nvidia = lib.mkIf cfg.enable {
        modesetting.enable = true;
        powerManagement.enable = false;
        open = false;
        nvidiaSettings = true;
      };
    };}
