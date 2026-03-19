{ lib, ... }:
{
  metadata = {
    name = "udiskie";
    description = "Module for `hardware.units.storage.udiskie`.";
    purpose = "Configure `hardware.units.storage.udiskie` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "hardware"
      "units"
      "storage"
      "udiskie"
    ];
  };

  home =
    { cfg, ... }:
    {
      services.udiskie = lib.mkIf cfg.enable {
        enable = true;
        automount = true;
        notify = true;
        tray = "never";
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable udiskie";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
