{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.blueman.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable blueman";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
