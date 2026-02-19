{ config, ... }:
{
  home-manager.users.${config.nixul.primaryUser} = {
    services.udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "never";
    };
  };
}
