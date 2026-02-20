{
  meta = {
    scope = "user";
    system = true;
    hm = false;
  };

  system =
    { config, ... }:
    {
      home-manager.users.${config.nixul.primaryUser} = {
        programs.lutris.enable = true;
      };
    };
}
