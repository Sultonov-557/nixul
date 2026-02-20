{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = _: {
    services.displayManager.gdm.enable = true;
  };
}
