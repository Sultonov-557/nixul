{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    { ... }:
    {
      programs.thunderbird = {
        enable = true;
        preferences = { };
      };
    };
}
