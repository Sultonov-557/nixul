{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.fzf = lib.mkIf cfg.enable {
        enable = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
      };
    };}
