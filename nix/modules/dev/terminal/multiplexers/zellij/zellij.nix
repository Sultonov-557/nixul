{ config, ... }:
{

  home-manager.users.${config.nixul.user} = {
    programs.zellij = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };

    xdg.configFile."zellij/config.kdl".source = ./zellij.kdl;
  };
}
