{
  meta = {
    scope = "user";
    hm = true;
    system = false;
  };

  home =
    { cfg, ... }:
    {
      programs.gemini-cli = {
        enable = true;
        settings = cfg.settings or { };
      };
    };
}
