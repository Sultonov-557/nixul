{ lib, ... }:
{
  system =
    { cfg, config, ... }:
    {
      networking.networkmanager.enable = lib.mkIf cfg.enable true;
      networking.hostName = lib.mkIf cfg.enable config.nixul.host.name;
    };}
