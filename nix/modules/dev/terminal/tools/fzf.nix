{ config, ... }:
{

  home-manager.users.${config.nixul.user} = {

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
  };
}
