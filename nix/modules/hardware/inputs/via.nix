{ lib, pkgs, ... }:
{
  metadata = {
    name = "via";
    description = "Module for `hardware.inputs.via`.";
    purpose = "Configure `hardware.inputs.via` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "inputs"
      "via"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ via ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable via";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
