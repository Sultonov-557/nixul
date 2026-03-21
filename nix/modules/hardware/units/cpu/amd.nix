{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      hardware.cpu.amd.updateMicrocode = lib.mkIf cfg.enable true;
    };}
