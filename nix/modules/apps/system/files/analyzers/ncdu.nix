{ lib, pkgs, ... }:
{
  metadata = {
    name = "ncdu";
    description = "Module for `apps.system.files.analyzers.ncdu`.";
    purpose = "Configure `apps.system.files.analyzers.ncdu` features and defaults.";
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
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ ncdu ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable ncdu";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
