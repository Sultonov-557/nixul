{ config, ... }:
{
  home-manager.users.${config.nixul.primaryUser} = {
    programs.lutris.enable = true;
  };
}
