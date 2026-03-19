{ lib, ... }:
{
  metadata = {
    name = "usb-automount";
    description = "Module for `hardware.units.storage.usb-automount`.";
    purpose = "Configure `hardware.units.storage.usb-automount` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "units"
      "storage"
      "usb-automount"
    ];
  };

  system =
    { cfg, ... }:
    {
      services.udisks2.enable = lib.mkIf cfg.enable true;
      services.devmon.enable = lib.mkIf cfg.enable true;
      services.gvfs.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable usb-automount";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
