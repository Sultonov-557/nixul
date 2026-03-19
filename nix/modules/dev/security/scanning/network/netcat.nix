{ lib, pkgs, ... }:
{
  metadata = {
    name = "netcat";
    description = "Module for `dev.security.scanning.network.netcat`.";
    purpose = "Configure `dev.security.scanning.network.netcat` features and defaults.";
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
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ netcat ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable netcat";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
