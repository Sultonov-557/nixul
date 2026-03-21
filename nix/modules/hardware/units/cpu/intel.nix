{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      hardware.cpu.intel.updateMicrocode = lib.mkIf cfg.enable true;
    };}
