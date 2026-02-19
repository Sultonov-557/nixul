{ config, ... }:
{
  home-manager.users.${config.nixul.primaryUser} = {
    programs.eza.enable = true;
  };
}
