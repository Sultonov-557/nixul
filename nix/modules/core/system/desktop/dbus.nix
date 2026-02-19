{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = {
    services.dbus.enable = true;
  };
}
