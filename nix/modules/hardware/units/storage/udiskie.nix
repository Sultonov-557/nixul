{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
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
    };
}
