{ lib, ... }:
{
  metadata = {
    name = "nvidia";
    description = "Module for `hardware.units.gpu.nvidia`.";
    purpose = "Configure `hardware.units.gpu.nvidia` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "units"
      "gpu"
      "nvidia"
    ];
  };

  system =
    { cfg, ... }:
    {
      hardware.nvidia = lib.mkIf cfg.enable {
        modesetting.enable = true;
        powerManagement.enable = false;
        open = false;
        nvidiaSettings = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nvidia";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
