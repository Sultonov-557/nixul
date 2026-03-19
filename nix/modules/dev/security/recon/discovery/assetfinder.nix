{ lib, pkgs, ... }:
{
  metadata = {
    name = "assetfinder";
    description = "Module for `dev.security.recon.discovery.assetfinder`.";
    purpose = "Configure `dev.security.recon.discovery.assetfinder` features and defaults.";
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
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ assetfinder ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable assetfinder";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
