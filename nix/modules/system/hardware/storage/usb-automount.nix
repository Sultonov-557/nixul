{
  lib,
  config,
  ...
}:
let
  cfg = config.modules.system.hardware.storage.usb-automount;
in
{
  options.modules.system.hardware.storage.usb-automount = {
    enable = lib.mkEnableOption "usb-automount";
  };

  config = lib.mkIf cfg.enable {
    services.udisks2.enable = true;
    services.devmon.enable = true;
    services.gvfs.enable = true;
  };
}
