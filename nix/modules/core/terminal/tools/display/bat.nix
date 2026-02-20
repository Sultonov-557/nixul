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
        programs.bat.enable = true;
      };
    };
}
