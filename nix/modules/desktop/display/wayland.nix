{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system = {
    programs.xwayland.enable = true;
  };
}
