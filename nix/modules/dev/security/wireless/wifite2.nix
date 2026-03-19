{ lib, pkgs, ... }:
{
  metadata = {
    name = "wifite2";
    description = "Module for `dev.security.wireless.wifite2`.";
    purpose = "Configure `dev.security.wireless.wifite2` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "security"
      "wireless"
      "wifite2"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ wifite2 ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable wifite2";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
