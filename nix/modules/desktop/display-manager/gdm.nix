{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = {
    services.displayManager.gdm.enable = true;
  };
}
