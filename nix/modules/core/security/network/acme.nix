{ config, ... }:
{
  security.acme = {
    acceptTerms = true;
    defaults = {
      email = config.nixul.email;
      dnsResolver = "1.1.1.1";
    };
  };
}
