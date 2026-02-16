{ config, ... }:
{
  home-manager.users.${config.nixul.user} = {
    programs.lazydocker = {
      enable = true;
    };
  };
}
