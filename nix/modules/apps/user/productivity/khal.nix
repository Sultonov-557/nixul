{ config, ... }:
{
  home-manager.users.${config.nixul.primaryUser} = {
    programs.khal = {
      enable = true;
    };
  };
}
