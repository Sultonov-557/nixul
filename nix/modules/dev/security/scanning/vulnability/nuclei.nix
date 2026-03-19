{ lib, pkgs, ... }:
{
  metadata = {
    name = "nuclei";
    description = "Module for `dev.security.scanning.vulnability.nuclei`.";
    purpose = "Configure `dev.security.scanning.vulnability.nuclei` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "security"
      "scanning"
      "vulnability"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [
        nuclei
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nuclei";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
