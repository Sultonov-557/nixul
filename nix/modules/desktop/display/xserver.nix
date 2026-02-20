{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = _: {
    services.xserver.enable = true;
  };
}
