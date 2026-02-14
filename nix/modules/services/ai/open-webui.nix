{ config, lib, ... }:
{
  services.nginx.virtualHosts = lib.mkIf config.nixul.services.server.nginx {
    ai = {
      serverName = "ai.home";
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:9999";
        proxyWebsockets = true;
      };
    };
  };

  services.unbound.settings.server.local-data =
    lib.optionals config.nixul.core.security.network.unbound
      [
        ''"ai.home. A 127.0.0.1"''
      ];

  services.open-webui = {
    enable = true;
    port = 9999;
  };
}
