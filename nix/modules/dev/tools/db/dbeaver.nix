{ lib, pkgs, ... }:
{
  metadata = {
    name = "dbeaver";
    description = "Module for `dev.tools.db.dbeaver`.";
    purpose = "Configure `dev.tools.db.dbeaver` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "tools"
      "db"
      "dbeaver"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ dbeaver-bin ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable dbeaver";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
