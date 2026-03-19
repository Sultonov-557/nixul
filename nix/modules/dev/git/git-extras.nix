{ lib, pkgs, ... }:
{
  metadata = {
    name = "git-extras";
    description = "Module for `dev.git.git-extras`.";
    purpose = "Configure `dev.git.git-extras` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "git"
      "git-extras"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ git-extras ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable git-extras";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
