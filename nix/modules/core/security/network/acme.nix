{
  meta = {
    scope = "host";
    system = true;
    hm = false;
  };

  system =
    { config, ... }:
    {
      security.acme = {
        acceptTerms = true;
        defaults = {
          email = config.nixul.users.${config.nixul.primaryUser}.email;
          dnsResolver = "1.1.1.1";
        };
      };
    };
}
