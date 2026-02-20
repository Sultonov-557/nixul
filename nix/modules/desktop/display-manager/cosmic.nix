{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = {
    services.displayManager.cosmic-greeter.enable = true;
  };
}
