{ config, ... }:
{
  home-manager.users.${config.nixul.user} = {
    programs.bat.enable = true;
  };
}
