{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      hardware.sane.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable sane";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
