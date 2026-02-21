{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      hardware.cpu.intel.updateMicrocode = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable intel cpu";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
