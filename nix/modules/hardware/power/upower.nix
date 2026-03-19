{ lib, ... }:
{
  metadata = {
    name = "upower";
    description = "Module for `hardware.power.upower`.";
    purpose = "Configure `hardware.power.upower` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "power"
      "upower"
    ];
  };

  system =
    { cfg, ... }:
    {
      services.upower.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable upower";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
