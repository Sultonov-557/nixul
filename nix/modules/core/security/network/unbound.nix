{ lib, ... }:
{
  system =
    { cfg, ... }:
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

            local-zone = [ "home. static" ];

            local-data = [
              ''"public.home. A 127.0.0.1"''
            ];

            cache-min-ttl = 3600;
            cache-max-ttl = 86400;
            prefetch = true;
            qname-minimisation = true;
          };
        };
      };

      networking.nameservers = lib.mkIf cfg.enable [ "127.0.0.1" ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable unbound";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
