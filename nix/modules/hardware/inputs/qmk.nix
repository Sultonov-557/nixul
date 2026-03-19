{ lib, pkgs, ... }:
{
  metadata = {
    name = "qmk";
    description = "Module for `hardware.inputs.qmk`.";
    purpose = "Configure `hardware.inputs.qmk` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "inputs"
      "qmk"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ qmk ]);
      hardware.keyboard.qmk = lib.mkIf cfg.enable {
        enable = true;
        keychronSupport = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable qmk";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
