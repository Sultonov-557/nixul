{
  meta = {
    scope = "user";
    hm = true;
    system = false;
  };

  home =
    { cfg, ... }:
    {
      programs.codex = {
        enable = true;
        custom-instructions = cfg.instructions or "";
      };
    };
}
