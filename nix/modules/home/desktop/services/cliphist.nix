{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.desktop.services.cliphist;
in
{
  options.modules.desktop.services.cliphist = {
    enable = lib.mkEnableOption "cliphist";
  };

  config = lib.mkIf cfg.enable {
    services.cliphist.enable = true;

    home.packages = with pkgs; [
      cliphist
      wl-clipboard
    ];
  };
}
