{ lib, pkgs, ... }:
{
  metadata = {
    name = "python";
    description = "Module for `dev.runtimes.python`.";
    purpose = "Configure `dev.runtimes.python` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "runtimes"
      "python"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ python3 ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable python";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
