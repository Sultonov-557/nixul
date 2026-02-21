{ lib, ... }:
{
  options = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable codex";
    };
    instructions = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Custom instructions for codex";
    };
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
