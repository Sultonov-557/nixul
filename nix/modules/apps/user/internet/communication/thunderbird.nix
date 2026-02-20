{
  meta = {
    scope = "user";
    system = true;
    hm = false;
  };

  system = _: {
    programs.thunderbird = {
      enable = true;
    };
  };
}
