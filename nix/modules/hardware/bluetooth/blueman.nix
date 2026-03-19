{ lib, ... }:
{
  metadata = {
    name = "blueman";
    description = "Module for `hardware.bluetooth.blueman`.";
    purpose = "Configure `hardware.bluetooth.blueman` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "bluetooth"
      "blueman"
    ];
  };

  system =
    { cfg, ... }:
    {
      services.blueman.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable blueman";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
