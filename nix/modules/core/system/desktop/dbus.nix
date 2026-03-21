{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.dbus.enable = lib.mkIf cfg.enable true;
    };}
