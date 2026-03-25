{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.foot = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  home =
    { cfg, ... }:
    {
      programs.foot = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable foot";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
