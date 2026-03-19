{ lib, pkgs, ... }:
{
  metadata = {
    name = "sherlock";
    description = "Module for `dev.security.recon.discovery.sherlock`.";
    purpose = "Configure `dev.security.recon.discovery.sherlock` features and defaults.";
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
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ sherlock ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable sherlock";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
