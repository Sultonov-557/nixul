{ lib, pkgs, ... }:
{
  metadata = {
    name = "nautilus";
    description = "Module for `apps.system.files.managers.nautilus`.";
    purpose = "Configure `apps.system.files.managers.nautilus` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "system"
      "files"
      "managers"
    ];
  };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (
        with pkgs;
        [
          nautilus
          gvfs
        ]
      );
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nautilus";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
