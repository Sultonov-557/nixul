{
  services.unbound = {
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

        local-zone = [ "home. static" ];

        local-data = [
          ''"dashy.home. A 127.0.0.1"''
          ''"dashboard.home. A 127.0.0.1"''
          ''"public.home. A 127.0.0.1"''
        ];

        cache-min-ttl = 3600;
        cache-max-ttl = 86400;
        prefetch = true;
        qname-minimisation = true;
      };
    };
  };

  networking.nameservers = [ "127.0.0.1" ];
}
