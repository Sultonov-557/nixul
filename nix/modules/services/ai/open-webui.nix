{ lib, ... }:
{
  metadata = {
    name = "open-webui";
    description = "Module for `services.ai.open-webui`.";
    purpose = "Configure `services.ai.open-webui` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "services"
      "ai"
      "open-webui"
    ];
  };

  system =
    { cfg, nixul, ... }:
    let
      tlsCertificatePath = "/var/lib/internal-ca/certs/home-wildcard.crt";
      tlsCertificateKeyPath = "/var/lib/internal-ca/private/home-wildcard.key";
    in
    {
      services.open-webui = lib.mkIf cfg.enable {
        enable = true;
        port = 9004;
      };

      services.nginx.virtualHosts.open-webui = lib.mkIf cfg.enable {
        serverName = "open-webui.home";
        addSSL = true;
        sslCertificate = tlsCertificatePath;
        sslCertificateKey = tlsCertificateKeyPath;
        locations."/" = {
          proxyPass = "http://127.0.0.1:9004";
          proxyWebsockets = true;
        };
      };

      services.unbound.settings.server.local-data = lib.mkIf cfg.enable [
        ''"open-webui.home. A 127.0.0.1"''
      ];

    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable open-webui";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
