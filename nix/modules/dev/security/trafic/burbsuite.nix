{ lib, pkgs, ... }:
{
  metadata = {
    name = "burbsuite";
    description = "Module for `dev.security.trafic.burbsuite`.";
    purpose = "Configure `dev.security.trafic.burbsuite` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "security"
      "trafic"
      "burbsuite"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [
        burpsuite
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable burpsuite";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
