{ lib, ... }:
{

  home =
    { cfg, ... }:
    {
      programs.codex = lib.mkIf cfg.enable {
        enable = true;
        custom-instructions = cfg.instructions or "";
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
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
    };
    default = {
      enable = false;
    };
  };

}
