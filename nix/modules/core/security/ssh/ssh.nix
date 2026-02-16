{ config, ... }:
{
  home-manager.users.${config.nixul.user} = {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
    };
  };
}
