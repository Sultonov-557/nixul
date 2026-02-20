{
  meta = {
    scope = "user";
    system = true;
    hm = false;
  };

  system = _: {
    programs.gamemode.enable = true;
  };
}
