{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    { ... }:
    {
      programs.gh = {
        enable = true;
        gitCredentialHelper = {
          enable = true;
        };
      };
    };
}
