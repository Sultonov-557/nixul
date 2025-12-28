{
  lib,
  config,
  ...
}:
let
  cfg = config.modules.desktop.services.notifications;
in
{
  options.modules.desktop.services.notifications = {
    enable = lib.mkEnableOption "notifications (mako)";
  };

  config = lib.mkIf cfg.enable {
    services.mako = {
      enable = true;

      settings = {
        border-radius = 10;
        border-size = 2;

        width = 350;
        height = 100;
        margin = "10";
        padding = "15";

        default-timeout = 5000;

        anchor = "top-right";

        layer = "overlay";
      };

      extraConfig = ''
        [urgency=high]
        border-color=#FF3B30
        default-timeout=0
      '';
    };
  };
}
