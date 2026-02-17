{ config, ... }:
{
  services.displayManager.dms-greeter = {
    enable = true;
    configHome = "/home/${config.nixul.user}/.config/DankMaterialShell/settings.json";
  };
}
