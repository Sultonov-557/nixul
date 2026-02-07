{ config, ... }:
{

  home-manager.users.${config.nixul.user} = {
    services.udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "never";
    };
  };
}
