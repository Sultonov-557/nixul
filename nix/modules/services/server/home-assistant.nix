{
  lib,
  ...
}:
{
  system =
    { cfg, nixul, ... }:
    let
      tlsCertificatePath = "/var/lib/internal-ca/certs/home-wildcard.crt";
      tlsCertificateKeyPath = "/var/lib/internal-ca/private/home-wildcard.key";
      nginxEnabled = lib.attrByPath [
        "host"
        "modules"
        "services"
        "server"
        "nginx"
        "enable"
      ] false nixul;
      unboundEnabled = lib.attrByPath [
        "host"
        "modules"
        "core"
        "security"
        "network"
        "unbound"
        "enable"
      ] false nixul;
    in
    {
      services.home-assistant = lib.mkIf cfg.enable {
        enable = true;
        configWriteable = true;
        extraComponents = [
          "esphome"
          "met"
          "radio_browser"
        ];
        config = {
          default_config = { };
          http = {
            server_port = 9002;
            use_x_forwarded_for = true;
            trusted_proxies = [
              "127.0.0.1"
              "::1"
            ];
          };
        };
      };

      services.nginx.virtualHosts.homeassistant = lib.mkIf (cfg.enable && nginxEnabled) {
        serverName = "ha.home";
        addSSL = true;
        sslCertificate = tlsCertificatePath;
        sslCertificateKey = tlsCertificateKeyPath;
        locations."/" = {
          proxyPass = "http://127.0.0.1:9002";
          proxyWebsockets = true;
        };
      };

      services.unbound.settings.server.local-data = lib.mkIf (cfg.enable && unboundEnabled) [
        ''"ha.home. A 127.0.0.1"''
      ];

      assertions = [
        {
          assertion = (!cfg.enable) || nginxEnabled;
          message = "services.server.home-assistant requires services.server.nginx.enable = true";
        }
        {
          assertion = (!cfg.enable) || unboundEnabled;
          message = "services.server.home-assistant requires core.security.network.unbound.enable = true";
        }
      ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable Home Assistant";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
