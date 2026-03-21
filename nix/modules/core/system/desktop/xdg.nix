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
    };}
