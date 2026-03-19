{ lib, pkgs, ... }:
{
  metadata = {
    name = "caido";
    description = "Module for `dev.security.trafic.caido`.";
    purpose = "Configure `dev.security.trafic.caido` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "security"
      "trafic"
      "caido"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [
        caido
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable caido";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
