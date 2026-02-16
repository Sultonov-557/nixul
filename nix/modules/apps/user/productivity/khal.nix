{ config, ... }:
{
  home-manager.users.${config.nixul.user} = {
    programs.khal = {
      enable = true;
    };
  };
}
