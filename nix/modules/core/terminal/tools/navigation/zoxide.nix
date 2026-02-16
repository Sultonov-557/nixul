{ config, ... }:
{
  home-manager.users.${config.nixul.user} = {
    programs.zoxide.enable = true;
  };
}
