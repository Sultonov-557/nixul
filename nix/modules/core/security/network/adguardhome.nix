{ lib, ... }:
{
  metadata = {
    name = "adguardhome";
    description = "Module for `core.security.network.adguardhome`.";
    purpose = "Configure `core.security.network.adguardhome` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "security"
      "network"
      "adguardhome"
    ];
  };

  system =
    { cfg, ... }:
    let
      tlsCertificatePath = "/var/lib/internal-ca/certs/home-wildcard.crt";
      tlsCertificateKeyPath = "/var/lib/internal-ca/private/home-wildcard.key";
    in
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
            upstream = [ "127.0.0.1:5335" ];
          };
        };
      };
      networking.nameservers = lib.mkIf cfg.enable [
        "127.0.0.1"
      ];

      services.nginx.virtualHosts.adguardhome = lib.mkIf cfg.enable {
        serverName = "adguard.home";
        addSSL = true;
        sslCertificate = tlsCertificatePath;
        sslCertificateKey = tlsCertificateKeyPath;
        locations."/" = {
          proxyPass = "http://127.0.0.1:9000";
        };
      };

      services.unbound.settings.server.local-data = lib.mkIf cfg.enable [
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
