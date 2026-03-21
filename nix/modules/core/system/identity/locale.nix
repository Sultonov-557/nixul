{ lib, ... }:
{
  system =
    { cfg, config, ... }:
    {
      time.timeZone = lib.mkIf cfg.enable config.nixul.host.timezone;
      i18n.defaultLocale = lib.mkIf cfg.enable "en_US.UTF-8";
      services.timesyncd.enable = lib.mkIf cfg.enable true;
    };}
