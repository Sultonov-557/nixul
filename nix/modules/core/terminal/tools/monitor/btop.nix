{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    { ... }:
    {
      programs.btop = {
        enable = true;
        settings = {
          theme_background = false;
          vim_keys = true;
        };
      };
    };
}
