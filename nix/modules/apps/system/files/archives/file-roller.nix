{ lib, pkgs, ... }:
{
  metadata = {
    name = "file-roller";
    description = "Module for `apps.system.files.archives.file-roller`.";
    purpose = "Configure `apps.system.files.archives.file-roller` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "system"
      "files"
      "archives"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [
        file-roller
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable file-roller";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
