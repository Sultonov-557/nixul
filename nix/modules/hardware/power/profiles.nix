{ lib, ... }:
{
  metadata = {
    name = "profiles";
    description = "Module for `hardware.power.profiles`.";
    purpose = "Configure `hardware.power.profiles` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "power"
      "profiles"
    ];
  };

  system =
    { cfg, ... }:
    {
      services.power-profiles-daemon.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable power-profiles";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
