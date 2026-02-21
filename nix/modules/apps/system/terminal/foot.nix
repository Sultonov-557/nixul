{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.foot = lib.mkIf cfg.enable {
        enable = true;
        settings = {
          cursor = {
            style = "block";
            blink = "yes";
          };
        };
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
