{ config, ... }:
{
  home-manager.users.${config.nixul.user} = {
    services.easyeffects.enable = true;
  };
}
