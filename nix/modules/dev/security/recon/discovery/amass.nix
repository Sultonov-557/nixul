{ lib, pkgs, ... }:
{
  metadata = {
    name = "amass";
    description = "Module for `dev.security.recon.discovery.amass`.";
    purpose = "Configure `dev.security.recon.discovery.amass` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "security"
      "recon"
      "discovery"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ amass ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable amass";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
