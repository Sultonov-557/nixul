{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = {
    services.xserver.enable = true;
  };
}
