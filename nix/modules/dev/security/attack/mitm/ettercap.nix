{ lib, pkgs, ... }:
{
  metadata = {
    name = "ettercap";
    description = "Module for `dev.security.attack.mitm.ettercap`.";
    purpose = "Configure `dev.security.attack.mitm.ettercap` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "security"
      "attack"
      "mitm"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [
        ettercap
        ethtool
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable ettercap";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
