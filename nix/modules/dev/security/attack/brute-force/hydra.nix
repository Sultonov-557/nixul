{ lib, pkgs, ... }:
{
  metadata = {
    name = "hydra";
    description = "Module for `dev.security.attack.brute-force.hydra`.";
    purpose = "Configure `dev.security.attack.brute-force.hydra` features and defaults.";
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
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ thc-hydra ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable hydra";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
