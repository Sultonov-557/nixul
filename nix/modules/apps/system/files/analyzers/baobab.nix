{ lib, pkgs, ... }:
{
  metadata = {
    name = "baobab";
    description = "Module for `apps.system.files.analyzers.baobab`.";
    purpose = "Configure `apps.system.files.analyzers.baobab` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "system"
      "files"
      "analyzers"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ baobab ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable baobab";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
