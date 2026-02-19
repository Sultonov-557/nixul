{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = {
    security.polkit.enable = true;
  };
}
