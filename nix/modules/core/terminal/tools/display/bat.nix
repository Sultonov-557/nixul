{ config, ... }:
{
  home-manager.users.${config.nixul.primaryUser} = {
    programs.bat.enable = true;
  };
}
