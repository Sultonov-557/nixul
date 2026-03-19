{ lib, pkgs, ... }:
{
  metadata = {
    name = "p7zip";
    description = "Module for `apps.system.files.archives.p7zip`.";
    purpose = "Configure `apps.system.files.archives.p7zip` features and defaults.";
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
        p7zip
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable p7zip";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
