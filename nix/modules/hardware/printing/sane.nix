{ lib, ... }:
{
  metadata = {
    name = "sane";
    description = "Module for `hardware.printing.sane`.";
    purpose = "Configure `hardware.printing.sane` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "printing"
      "sane"
    ];
  };

  system =
    { cfg, ... }:
    {
      hardware.sane.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable sane";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
