{ lib, ... }:
{
  metadata = {
    name = "direnv";
    description = "Module for `dev.tools.env.direnv`.";
    purpose = "Configure `dev.tools.env.direnv` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "dev"
      "tools"
      "env"
      "direnv"
    ];
  };

  home =
    { cfg, ... }:
    {
      programs.direnv = lib.mkIf cfg.enable {
        enable = true;
        nix-direnv.enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable direnv";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
