{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      hardware.bluetooth = lib.mkIf cfg.enable {
        enable = true;
        powerOnBoot = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable bluetooth";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
