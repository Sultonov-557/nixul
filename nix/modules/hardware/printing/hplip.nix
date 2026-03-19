{ lib, pkgs, ... }:
{
  metadata = {
    name = "hplip";
    description = "Module for `hardware.printing.hplip`.";
    purpose = "Configure `hardware.printing.hplip` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "printing"
      "hplip"
    ];
  };

  system =
    { cfg, ... }:
    {
      services.printing.drivers = lib.mkIf cfg.enable (with pkgs; [
        hplip
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable hplip";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
