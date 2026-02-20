{
  meta = {
    scope = "host";
    system = false;
    hm = true;
  };

  home =
    { ... }:
    {
      programs.eza.enable = true;
    };
}
