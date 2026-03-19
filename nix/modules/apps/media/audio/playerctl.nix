{ lib, pkgs, ... }:
{
  metadata = {
    name = "playerctl";
    description = "Module for `apps.media.audio.playerctl`.";
    purpose = "Configure `apps.media.audio.playerctl` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "media"
      "audio"
      "playerctl"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ playerctl ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable playerctl";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
