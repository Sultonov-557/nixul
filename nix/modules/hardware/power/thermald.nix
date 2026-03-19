{ lib, ... }:
{
  metadata = {
    name = "thermald";
    description = "Module for `hardware.power.thermald`.";
    purpose = "Configure `hardware.power.thermald` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "power"
      "thermald"
    ];
  };

  system =
    { cfg, ... }:
    {
      services.thermald.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable thermald";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
