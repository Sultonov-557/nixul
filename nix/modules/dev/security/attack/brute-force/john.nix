{ lib, pkgs, ... }:
{
  metadata = {
    name = "john";
    description = "Module for `dev.security.attack.brute-force.john`.";
    purpose = "Configure `dev.security.attack.brute-force.john` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "security"
      "attack"
      "brute-force"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ john ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable john";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
