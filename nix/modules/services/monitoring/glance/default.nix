{
  config,
  lib,
  ...
}:
{
  imports = [
    ./settings.nix
  ];

  services = {
    glance = {
      enable = true;
    };
  };

  services.unbound.settings.server.local-data =
    lib.optionals config.nixul.core.security.network.unbound
      [
        ''"glance.home. A 127.0.0.1"''
      ];

  services.nginx.virtualHosts = lib.mkIf config.nixul.services.server.nginx {
    glance = {
      serverName = "glance.home";
      addSSL = config.nixul.core.security.network.acme;
      enableACME = config.nixul.core.security.network.acme;
      locations."/" = {
        proxyPass = "http://127.0.0.1:${toString config.services.glance.settings.server.port}";
      };
    };
  };
}
