{ config, ... }:
{
  home-manager.users.${config.nixul.primaryUser} = {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
  };
}
