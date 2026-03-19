{ lib, ... }:
{
  metadata = {
    name = "amd";
    description = "Module for `hardware.units.cpu.amd`.";
    purpose = "Configure `hardware.units.cpu.amd` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "units"
      "cpu"
      "amd"
    ];
  };

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
