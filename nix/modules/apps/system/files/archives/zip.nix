{ lib, pkgs, ... }:
{
  metadata = {
    name = "zip";
    description = "Module for `apps.system.files.archives.zip`.";
    purpose = "Configure `apps.system.files.archives.zip` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "apps"
      "system"
      "files"
      "archives"
    ];
  };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (
        with pkgs;
        [
          zip
        ]
      );
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable zip";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
