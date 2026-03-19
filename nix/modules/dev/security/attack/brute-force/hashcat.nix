{ lib, pkgs, ... }:
{
  metadata = {
    name = "hashcat";
    description = "Module for `dev.security.attack.brute-force.hashcat`.";
    purpose = "Configure `dev.security.attack.brute-force.hashcat` features and defaults.";
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
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [
        hashcat
        hashcat-utils
        clinfo
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable hashcat";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
