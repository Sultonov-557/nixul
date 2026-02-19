{ config, ... }:
{
  home-manager.users.${config.nixul.primaryUser} = {
    programs.lazydocker = {
      enable = true;
    };
  };
}
