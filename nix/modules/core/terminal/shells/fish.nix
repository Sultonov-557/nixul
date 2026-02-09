{ config, ... }:
{

  programs.fish.enable = true;
  home-manager.users.${config.nixul.user} = {
    programs.fish = {
      enable = true;
      shellInit = "set -U fish_greeting";
    };
  };
}
