{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = _: {
    services.blueman.enable = true;
  };
}
