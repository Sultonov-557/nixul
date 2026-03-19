{ lib, pkgs, ... }:
{
  metadata = {
    name = "winboat";
    description = "Module for `apps.gaming.compatibility.winboat`.";
    purpose = "Configure `apps.gaming.compatibility.winboat` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "gaming"
      "compatibility"
      "winboat"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (
        with pkgs;
        [
          winboat
        ]
      );
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable winboat";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
