{ lib, pkgs, ... }:
{
  metadata = {
    name = "wine";
    description = "Module for `apps.gaming.compatibility.wine`.";
    purpose = "Configure `apps.gaming.compatibility.wine` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "gaming"
      "compatibility"
      "wine"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (
        with pkgs;
        [
          wine
          winetricks
        ]
      );
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable wine";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
