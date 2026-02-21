{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.btop = lib.mkIf cfg.enable {
        enable = true;
        settings = {
          theme_background = false;
          vim_keys = true;
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable btop";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
