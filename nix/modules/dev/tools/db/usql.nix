{ lib, pkgs, ... }:
{
  metadata = {
    name = "usql";
    description = "Module for `dev.tools.db.usql`.";
    purpose = "Configure `dev.tools.db.usql` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "tools"
      "db"
      "usql"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ usql ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable usql";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
