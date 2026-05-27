{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      xdg.portal.enable = lib.mkIf cfg.enable true;
      xdg.portal.extraPortals = lib.mkIf cfg.enable [
        pkgs.xdg-desktop-portal-wlr
        pkgs.xdg-desktop-portal-gtk
      ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable xdg";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
