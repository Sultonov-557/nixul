{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      zramSwap = lib.mkIf cfg.enable {
        enable = true;
        memoryPercent = 50;
      };

      services.zram-generator = lib.mkIf cfg.enable {
        enable = true;
      };
    };}
