{ lib, ... }:
{
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
    };}
