{ lib, pkgs, ... }:
{
  metadata = {
    name = "go";
    description = "Module for `dev.runtimes.go`.";
    purpose = "Configure `dev.runtimes.go` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "runtimes"
      "go"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [
        go
        gopls
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable go";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
