{ lib, ... }:
{
  system =
    { cfg, config, ... }:
    {
      services.unbound = lib.mkIf cfg.enable {
        enable = true;

        settings = {
          server = {
            interface = [
              "127.0.0.1"
              "::1"
            ];
            access-control = [
              "127.0.0.0/8 allow"
              "::1 allow"
            ];
            port = 5335;

            local-zone = [ "home. static" ];

            local-data = [
              ''"public.home. A 127.0.0.1"''
            ];

            do-ip4 = true;
            do-ip6 = true;
            cache-min-ttl = 3600;
            cache-max-ttl = 86400;
            prefetch = true;
            qname-minimisation = true;
          };
        };
      };

      networking.nameservers = lib.mkIf (cfg.enable && !config.services.adguardhome.enable) [
        "127.0.0.1:5335"
      ];
    };}
