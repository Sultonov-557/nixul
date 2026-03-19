{ lib, pkgs, ... }:
{
  metadata = {
    name = "brightnessctl";
    description = "Module for `hardware.power.brightnessctl`.";
    purpose = "Configure `hardware.power.brightnessctl` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "power"
      "brightnessctl"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ brightnessctl ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable brightnessctl";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
