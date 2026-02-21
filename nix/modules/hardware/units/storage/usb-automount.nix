{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.udisks2.enable = lib.mkIf cfg.enable true;
      services.devmon.enable = lib.mkIf cfg.enable true;
      services.gvfs.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable usb-automount";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
