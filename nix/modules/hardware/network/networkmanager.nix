{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { config, ... }:
    {
      networking.networkmanager.enable = true;
      networking.hostName = config.nixul.host.name;

    };
}
