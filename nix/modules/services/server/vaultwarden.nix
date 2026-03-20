{ lib, config, ... }:
{
  metadata = {
    name = "vaultwarden";
    description = "Module for `services.server.vaultwarden`.";
    purpose = "Run Vaultwarden behind local reverse proxy and DNS defaults.";
    scope = "system";
    status = "active";
    tags = [
      "services"
      "server"
      "vaultwarden"
    ];
  };

  system =
    { cfg, ... }:
    let
      tlsCertificatePath = "/var/lib/internal-ca/certs/home-wildcard.crt";
      tlsCertificateKeyPath = "/var/lib/internal-ca/private/home-wildcard.key";
      nginxEnabled = true;
      unboundEnabled = true;
      sopsEnabled = true;
    in
    {
      sops.secrets.vaultwarden-admin-token = lib.mkIf (cfg.enable && sopsEnabled) {
        sopsFile = ../../../assets/secrets/password.yaml;
        key = "master_password";
        owner = "vaultwarden";
        group = "vaultwarden";
      };

      sops.templates.vaultwarden-runtime-env = lib.mkIf (cfg.enable && sopsEnabled) {
        owner = "vaultwarden";
        group = "vaultwarden";
        content = ''
          ADMIN_TOKEN=${config.sops.placeholder."vaultwarden-admin-token"}
        '';
      };

      services.vaultwarden = lib.mkIf cfg.enable {
        enable = true;
        config = {
          DOMAIN = "https://vault.home";
          ROCKET_ADDRESS = "127.0.0.1";
          ROCKET_PORT = 9006;
        };
      };

      systemd.services.vaultwarden.serviceConfig.EnvironmentFile = lib.mkIf (cfg.enable && sopsEnabled) [
        config.sops.templates.vaultwarden-runtime-env.path
      ];

      services.nginx.virtualHosts.vaultwarden = lib.mkIf (cfg.enable && nginxEnabled) {
        serverName = "vault.home";
        addSSL = true;
        sslCertificate = tlsCertificatePath;
        sslCertificateKey = tlsCertificateKeyPath;
        locations."/" = {
          proxyPass = "http://127.0.0.1:9006";
          proxyWebsockets = true;
        };
      };

      services.unbound.settings.server.local-data = lib.mkIf (cfg.enable && unboundEnabled) [
        ''"vault.home. A 127.0.0.1"''
      ];

    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable vaultwarden";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
