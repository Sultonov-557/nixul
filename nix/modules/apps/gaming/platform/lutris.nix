{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    { ... }:
    {
      programs.lutris.enable = true;
    };
}
