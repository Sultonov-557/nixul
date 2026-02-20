{
  meta = {
    scope = "user";
    system = true;
    hm = false;
  };

  system = _: {
    programs.gamescope.enable = true;
  };
}
