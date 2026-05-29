{
  lib,
  ...
}:

{
  system =
    { cfg, ... }:
    {
      services.desktopManager.gnome.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable gnome";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
