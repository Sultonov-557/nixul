{ lib, pkgs, ... }:
{
  metadata = {
    name = "inetutils";
    description = "Module for `dev.security.scanning.network.inetutils`.";
    purpose = "Configure `dev.security.scanning.network.inetutils` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "security"
      "scanning"
      "network"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ inetutils ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable inetutils";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
