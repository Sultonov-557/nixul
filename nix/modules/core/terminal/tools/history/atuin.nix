{ config, ... }:
{
  home-manager.users.${config.nixul.user} = {
    programs.atuin = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;

      settings = {
        auto_sync = true;
        sync_frequency = "10m";
        search_mode = "fuzzy";
      };
    };
  };
}
