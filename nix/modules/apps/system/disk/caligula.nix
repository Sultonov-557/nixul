{ lib, pkgs, ... }:
{
  metadata = {
    name = "caligula";
    description = "Module for `apps.system.disk.caligula`.";
    purpose = "Configure `apps.system.disk.caligula` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "system"
      "disk"
      "caligula"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ caligula ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable caligula";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
