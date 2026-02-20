{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { ... }:
    {
      services.udisks2.enable = true;
      services.devmon.enable = true;
      services.gvfs.enable = true;
    };
}
