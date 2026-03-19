{ lib, pkgs, ... }:
{
  metadata = {
    name = "todoist";
    description = "Module for `apps.user.productivity.todoist`.";
    purpose = "Configure `apps.user.productivity.todoist` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "user"
      "productivity"
      "todoist"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ todoist-electron ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable todoist";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
