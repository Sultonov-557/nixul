{ lib, pkgs, ... }:
{
  metadata = {
    name = "ffmpeg";
    description = "Module for `apps.media.video.ffmpeg`.";
    purpose = "Configure `apps.media.video.ffmpeg` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "media"
      "video"
      "ffmpeg"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ ffmpeg ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable ffmpeg";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
