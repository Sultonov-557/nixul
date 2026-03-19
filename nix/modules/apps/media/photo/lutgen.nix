{ lib, pkgs, ... }:
{
  metadata = {
    name = "lutgen";
    description = "Module for `apps.media.photo.lutgen`.";
    purpose = "Configure `apps.media.photo.lutgen` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "media"
      "photo"
      "lutgen"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [
        lutgen
        lutgen-studio
      ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable lutgen";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
