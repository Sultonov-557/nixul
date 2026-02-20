{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { config, ... }:
    {
      services.displayManager.dms-greeter = {
        enable = true;
        configHome = "/home/${config.nixul.user}/.config/DankMaterialShell/settings.json";
      };
    };
}
