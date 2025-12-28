{
  lib,
  config,
  ...
}:
let
  cfg = config.modules.desktop.services.udiskie;
in
{
  options.modules.desktop.services.udiskie = {
    enable = lib.mkEnableOption "udiskie";
  };

  config = lib.mkIf cfg.enable {
    services.udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "never";
    };
  };
}
