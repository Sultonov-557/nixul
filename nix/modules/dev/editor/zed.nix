{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    { ... }:
    {
      programs.zed-editor = {
        enable = true;
      };
    };
}
