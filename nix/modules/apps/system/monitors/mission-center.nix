{ lib, pkgs, ... }:
{
  metadata = {
    name = "mission-center";
    description = "Module for `apps.system.monitors.mission-center`.";
    purpose = "Configure `apps.system.monitors.mission-center` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "system"
      "monitors"
      "mission-center"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ mission-center ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable mission-center";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
