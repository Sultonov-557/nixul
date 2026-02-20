{
  meta = {
    scope = "user";
    system = true;
    hm = false;
  };

  system = _: {
    programs.steam.enable = true;
  };
}
