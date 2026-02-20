{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    { ... }:
    {
      programs.foot = {
        enable = true;
        settings = {
          cursor = {
            style = "block";
            blink = "yes";
          };
        };
      };
    };
}
