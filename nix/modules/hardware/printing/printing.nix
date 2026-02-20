{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = _: {
    services.printing.enable = true;
  };
}
