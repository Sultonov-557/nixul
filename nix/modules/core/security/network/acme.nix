{ lib, ... }:
{
  system =
    { cfg, config, ... }:
    {
      security.acme = lib.mkIf cfg.enable {
        acceptTerms = true;
        defaults = {
          email = config.nixul.users.${config.nixul.primaryUser}.email;
          dnsResolver = "1.1.1.1";
        };
      };
    };}
