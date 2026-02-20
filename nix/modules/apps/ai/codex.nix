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
      programs.codex = lib.mkIf cfg.enable or false {
        enable = true;
        custom-instructions = cfg.instructions or "";
      };
    };
}
