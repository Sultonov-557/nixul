{ lib, ... }:
{
  metadata = {
    name = "github";
    description = "Module for `dev.git.github`.";
    purpose = "Configure `dev.git.github` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "dev"
      "git"
      "github"
    ];
  };

  home =
    { cfg, ... }:
    {
      programs.gh = lib.mkIf cfg.enable {
        enable = true;
        gitCredentialHelper = {
          enable = true;
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable github";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
