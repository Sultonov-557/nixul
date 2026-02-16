{ config, ... }:
{
  time.timeZone = config.nixul.timezone;
  i18n.defaultLocale = "en_US.UTF-8";

  services.timesyncd.enable = true;
}
