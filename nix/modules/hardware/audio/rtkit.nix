{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = _: {
    security.rtkit.enable = true;
  };
}
