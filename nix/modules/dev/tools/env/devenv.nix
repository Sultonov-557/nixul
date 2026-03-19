{ lib, pkgs, ... }:
{
  metadata = {
    name = "devenv";
    description = "Module for `dev.tools.env.devenv`.";
    purpose = "Configure `dev.tools.env.devenv` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "dev"
      "tools"
      "env"
      "devenv"
    ];
  };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ devenv ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable devenv";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
