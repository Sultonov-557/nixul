{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      powerManagement = lib.mkIf cfg.enable {
        enable = true;
        cpuFreqGovernor = "schedutil";
      };
    };}
