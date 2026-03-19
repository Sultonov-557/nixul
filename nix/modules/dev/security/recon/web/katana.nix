{ lib, pkgs, ... }:
{
  metadata = {
    name = "katana";
    description = "Module for `dev.security.recon.web.katana`.";
    purpose = "Configure `dev.security.recon.web.katana` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "security"
      "recon"
      "web"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ katana ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable katana";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
