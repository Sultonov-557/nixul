{ lib, pkgs, ... }:
{
  metadata = {
    name = "bettercap";
    description = "Module for `dev.security.attack.mitm.bettercap`.";
    purpose = "Configure `dev.security.attack.mitm.bettercap` features and defaults.";
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
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ bettercap ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable bettercap";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
