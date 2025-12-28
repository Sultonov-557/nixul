{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.desktop.services.audio;
in
{
  options.modules.desktop.services.audio = {
    enable = lib.mkEnableOption "desktop audio tools";
  };

  config = lib.mkIf cfg.enable {
    services.easyeffects.enable = true;

    home.packages = with pkgs; [
      pavucontrol
      pulsemixer
    ];
  };
}
