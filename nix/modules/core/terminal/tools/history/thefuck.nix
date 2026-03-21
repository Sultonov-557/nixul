{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.pay-respects = lib.mkIf cfg.enable {
        enable = true;        enableZshIntegration = true;
        enableFishIntegration = true;
      };
    };}
