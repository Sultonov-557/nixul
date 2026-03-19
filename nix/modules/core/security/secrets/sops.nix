{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  metadata = {
    name = "sops";
    description = "Module for `core.security.secrets.sops`.";
    purpose = "Configure `core.security.secrets.sops` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "security"
      "secrets"
      "sops"
    ];
  };

  system =
    { cfg, config, ... }:
    {
      imports = [
        inputs.sops-nix.nixosModules.sops
      ];

      sops = lib.mkIf cfg.enable {
        defaultSopsFile = ../../../assets/secrets/password.yaml;
        defaultSopsFormat = "yaml";
        age.keyFile = "/home/${config.nixul.primaryUser}/.config/sops/age/keys.txt";
      };

      environment.systemPackages = lib.mkIf cfg.enable [
        pkgs.sops
        pkgs.age
      ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable sops";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
