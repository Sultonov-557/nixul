{ lib, ... }:
{
  system =
    { cfg, nixul, ... }:
    {
      services.adguardhome = lib.mkIf cfg.enable {
        enable = true;
        port = 9000;

        settings = {
          http = {
            address = "127.0.0.1:9000";
          };
          dns = {
            port = 53;
            upstream = [
              (if nixul.host.modules.core.security.network.unbound.enable then "127.0.0.1:5335" else "1.1.1.1")
            ];
          };
        };
      };
      networking.nameservers = lib.mkIf cfg.enable [
        "127.0.0.1"
      ];

      services.nginx.virtualHosts.adguardhome =
        lib.mkIf (cfg.enable && nixul.host.modules.services.server.nginx.enable)
          {
            serverName = "adguard.home";
            locations."/" = {
              proxyPass = "http://127.0.0.1:9000";
            };
          };

      services.unbound.settings.server.local-data =
        lib.mkIf (cfg.enable && nixul.host.modules.core.security.network.unbound.enable)
          [
            ''"adguard.home. A 127.0.0.1"''
          ];

    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable adguardhome";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
