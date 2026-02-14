{ config, ... }:
{
  home-manager.users.${config.nixul.user} = {
    programs.eza.enable = true;
  };
}
