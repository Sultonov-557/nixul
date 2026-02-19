{ config, ... }:
{
  home-manager.users.${config.nixul.primaryUser} = {
    programs.fastfetch = {
      enable = true;

      settings = { };
    };
  };
}
