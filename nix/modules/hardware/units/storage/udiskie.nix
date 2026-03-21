{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      services.udiskie = lib.mkIf cfg.enable {
        enable = true;
        automount = true;
        notify = true;
        tray = "never";
      };
    };}
