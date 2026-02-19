{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { config, ... }:
    {
      time.timeZone = config.nixul.host.timezone;
      i18n.defaultLocale = "en_US.UTF-8";
      services.timesyncd.enable = true;
    };
}
