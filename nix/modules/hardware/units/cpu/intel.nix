{ lib, ... }:
{
  metadata = {
    name = "intel";
    description = "Module for `hardware.units.cpu.intel`.";
    purpose = "Configure `hardware.units.cpu.intel` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "units"
      "cpu"
      "intel"
    ];
  };

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
