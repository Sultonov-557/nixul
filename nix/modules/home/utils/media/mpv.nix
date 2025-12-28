{
  lib,
  config,
  ...
}:
let
  cfg = config.modules.utils.media.mpv;
in
{
  options.modules.utils.media.mpv = {
    enable = lib.mkEnableOption "media tools (mpv)";
  };

  config = lib.mkIf cfg.enable {
    programs.mpv = {
      enable = true;
      config = {
        hwdec = "auto";
        vo = "gpu";
        profile = "gpu-hq";
        save-position-on-quit = true;
      };
    };
  };
}
