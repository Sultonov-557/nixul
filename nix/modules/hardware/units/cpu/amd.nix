{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      hardware.cpu.amd.updateMicrocode = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable amd cpu";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
