{ lib, ... }:
{
  metadata = {
    name = "mpv";
    description = "Module for `apps.media.video.mpv`.";
    purpose = "Configure `apps.media.video.mpv` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "apps"
      "media"
      "video"
      "mpv"
    ];
  };

  home =
    { cfg, ... }:
    {
      programs.mpv = lib.mkIf cfg.enable {
        enable = true;
        config = {
          hwdec = "auto";
          vo = "gpu";
          profile = "gpu-hq";
          save-position-on-quit = true;

          osd-bar-align-y = 0.9;
          osd-bar-h = 2;
          osd-bar-w = 60;
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable mpv";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
