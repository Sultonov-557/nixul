{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.zoxide = lib.mkIf cfg.enable {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
      };
    };}
