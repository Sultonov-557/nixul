{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = _: {
    programs.xwayland.enable = true;
  };
}
