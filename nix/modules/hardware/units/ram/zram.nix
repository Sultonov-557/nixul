{ lib, ... }:
{
  metadata = {
    name = "zram";
    description = "Module for `hardware.units.ram.zram`.";
    purpose = "Configure `hardware.units.ram.zram` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "units"
      "ram"
      "zram"
    ];
  };

  system =
    { cfg, ... }:
    {
      zramSwap = lib.mkIf cfg.enable {
        enable = true;
        memoryPercent = 50;
      };

      services.zram-generator = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable zram";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
