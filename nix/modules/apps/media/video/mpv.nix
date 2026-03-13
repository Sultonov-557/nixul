{ lib, ... }:
{
  home =
    { cfg, osConfig, ... }:
    {
      programs.mpv = lib.mkIf cfg.enable {
        enable = true;
        config =
          let
            palette = osConfig.nixul.theme.colors.palette;
          in
          {
            hwdec = "auto";
            vo = "gpu";
            profile = "gpu-hq";
            save-position-on-quit = true;

            osd-color = "#${palette.base05}";
            osd-border-color = "#${palette.base00}";
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
