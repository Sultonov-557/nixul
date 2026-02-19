{ config, ... }:
{
  home-manager.users.${config.nixul.primaryUser} = {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
    };
  };
}
