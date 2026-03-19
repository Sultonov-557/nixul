{ lib, pkgs, ... }:
{
  metadata = {
    name = "aseprite";
    description = "Module for `apps.media.photo.aseprite`.";
    purpose = "Configure `apps.media.photo.aseprite` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "media"
      "photo"
      "aseprite"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ aseprite ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable aseprite";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
