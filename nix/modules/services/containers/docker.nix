{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { config, ... }:
    {
      virtualisation.docker = {
        enable = true;
        enableOnBoot = true;
      };

      users.users.${config.nixul.primaryUser}.extraGroups = [ "docker" ];
    };
}
