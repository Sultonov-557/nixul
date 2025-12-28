{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.apps.communication.telegram;
in
{
  options.modules.apps.communication.telegram = {
    enable = lib.mkEnableOption "telegram";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ telegram-desktop ];
  };
}
