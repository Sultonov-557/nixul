{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    { ... }:
    {
      programs.fastfetch = {
        enable = true;

        settings = { };
      };
    };
}
