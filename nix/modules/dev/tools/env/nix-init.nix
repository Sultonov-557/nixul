{ lib, ... }:
{
  metadata = {
    name = "nix-init";
    description = "Module for `dev.tools.env.nix-init`.";
    purpose = "Configure `dev.tools.env.nix-init` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "dev"
      "tools"
      "env"
      "nix-init"
    ];
  };

  home =
    { cfg, ... }:
    {
      programs.nix-init = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nix-init";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
