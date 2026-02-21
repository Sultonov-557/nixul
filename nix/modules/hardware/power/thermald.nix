{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.thermald.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable thermald";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
