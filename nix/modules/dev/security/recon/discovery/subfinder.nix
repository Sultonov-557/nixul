{ lib, pkgs, ... }:
{
  metadata = {
    name = "subfinder";
    description = "Module for `dev.security.recon.discovery.subfinder`.";
    purpose = "Configure `dev.security.recon.discovery.subfinder` features and defaults.";
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
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ subfinder ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable subfinder";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
