{ config, ... }:
{
  programs.fish.enable = true;
  home-manager.users.${config.nixul.primaryUser} = {
    programs.fish = {
      enable = true;
      shellInit = "set -U fish_greeting";
    };
  };
}
