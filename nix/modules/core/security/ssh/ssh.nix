{
  meta = {
    scope = "user";
    hm = true;
    system = false;
  };

  home = _: {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
    };
  };
}
