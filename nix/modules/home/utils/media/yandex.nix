{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.utils.media.yandex;
in
{
  options.modules.utils.media.yandex = {
    enable = lib.mkEnableOption "yandex music";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ yandex-music ];
  };
}
