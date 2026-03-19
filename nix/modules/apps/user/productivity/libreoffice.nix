{ lib, pkgs, ... }:
{
  metadata = {
    name = "libreoffice";
    description = "Module for `apps.user.productivity.libreoffice`.";
    purpose = "Configure `apps.user.productivity.libreoffice` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "user"
      "productivity"
      "libreoffice"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ libreoffice-fresh ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable libreoffice";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
