{ lib, pkgs, ... }:
{
  metadata = {
    name = "unzip";
    description = "Module for `apps.system.files.archives.unzip`.";
    purpose = "Configure `apps.system.files.archives.unzip` features and defaults.";
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
        unzip
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable unzip";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
