{ lib, pkgs, ... }:
{
  metadata = {
    name = "gparted";
    description = "Module for `apps.system.disk.gparted`.";
    purpose = "Configure `apps.system.disk.gparted` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "system"
      "disk"
      "gparted"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ gparted ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable gparted";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
