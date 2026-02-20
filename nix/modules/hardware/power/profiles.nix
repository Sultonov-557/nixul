{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { ... }:
    {
      services.power-profiles-daemon.enable = true;
    };
}
