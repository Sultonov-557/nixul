{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = {
    services.displayManager.sddm.enable = true;
  };
}
