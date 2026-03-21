{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.atuin = lib.mkIf cfg.enable {
        enable = true;
        enableZshIntegration = true;
        enableFishIntegration = true;

        settings = {
          auto_sync = true;
          sync_frequency = "10m";
          search_mode = "fuzzy";
        };
      };
    };}
