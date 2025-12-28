{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.apps.productivity.libreoffice;
in
{
  options.modules.apps.productivity.libreoffice = {
    enable = lib.mkEnableOption "libreoffice";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ libreoffice-fresh ];
  };
}
