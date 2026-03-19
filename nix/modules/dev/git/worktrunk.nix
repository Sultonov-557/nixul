{ lib, pkgs, ... }:
{
  metadata = {
    name = "worktrunk";
    description = "Module for `dev.git.worktrunk`.";
    purpose = "Configure `dev.git.worktrunk` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "dev"
      "git"
      "worktrunk"
    ];
  };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (
        with pkgs;
        [
          worktrunk
        ]
      );
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable worktrunk";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
