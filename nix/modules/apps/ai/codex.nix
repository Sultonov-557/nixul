{ lib, ... }:
{
  meta = {
    scope = "user";
    hm = true;
    system = false;
  };

  home =
    { cfg, ... }:
    {
      programs.codex = lib.mkIf cfg.enable {
        enable = true;
        custom-instructions = cfg.instructions or "";
      };
    };
}
