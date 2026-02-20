{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = _: {
    services.upower.enable = true;
  };
}
