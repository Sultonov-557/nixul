{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = _: {
    services.thermald.enable = true;
  };
}
