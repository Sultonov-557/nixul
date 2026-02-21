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
