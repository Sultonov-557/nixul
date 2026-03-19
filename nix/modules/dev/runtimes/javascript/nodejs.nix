{ lib, pkgs, ... }:
{
  metadata = {
    name = "nodejs";
    description = "Module for `dev.runtimes.javascript.nodejs`.";
    purpose = "Configure `dev.runtimes.javascript.nodejs` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "runtimes"
      "javascript"
      "nodejs"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ nodejs_22 ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nodejs";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
