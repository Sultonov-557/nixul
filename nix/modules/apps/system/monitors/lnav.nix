{ lib, pkgs, ... }:
{
  metadata = {
    name = "lnav";
    description = "Module for `apps.system.monitors.lnav`.";
    purpose = "Configure `apps.system.monitors.lnav` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "system"
      "monitors"
      "lnav"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ lnav ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable lnav";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
