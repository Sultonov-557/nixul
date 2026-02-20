{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { ... }:
    {
      system.autoUpgrade = {
        enable = true;
        dates = "daily";
        upgrade = false;
      };
    };
}
