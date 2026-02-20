{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = _: {
    hardware.sane.enable = true;
  };
}
