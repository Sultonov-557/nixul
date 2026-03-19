{ lib, ... }:
{
  metadata = {
    name = "unbound";
    description = "Module for `core.security.network.unbound`.";
    purpose = "Configure `core.security.network.unbound` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "security"
      "network"
      "unbound"
    ];
  };

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
