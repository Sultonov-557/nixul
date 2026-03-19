{ lib, ... }:
{
  metadata = {
    name = "power-management";
    description = "Module for `hardware.power.power-management`.";
    purpose = "Configure `hardware.power.power-management` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "power"
      "power-management"
    ];
  };

  system =
    { cfg, ... }:
    {
      powerManagement = lib.mkIf cfg.enable {
        enable = true;
        cpuFreqGovernor = "schedutil";
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable power-management";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
