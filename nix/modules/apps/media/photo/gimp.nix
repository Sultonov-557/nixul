{ lib, pkgs, ... }:
{
  metadata = {
    name = "gimp";
    description = "Module for `apps.media.photo.gimp`.";
    purpose = "Configure `apps.media.photo.gimp` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "media"
      "photo"
      "gimp"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ gimp ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable gimp";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
