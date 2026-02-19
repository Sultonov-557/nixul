{ config, ... }:
{
  home-manager.users.${config.nixul.primaryUser} = {
    programs.zoxide.enable = true;
  };
}
