{ lib, pkgs, ... }:
{
  metadata = {
    name = "obsidian";
    description = "Module for `apps.user.productivity.obsidian`.";
    purpose = "Configure `apps.user.productivity.obsidian` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "user"
      "productivity"
      "obsidian"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ obsidian ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable obsidian";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
