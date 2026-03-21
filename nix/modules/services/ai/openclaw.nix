{ lib, ... }:
{

  system =
    {
      cfg,
      config,
      pkgs,
      ...
    }:
    let
      port = 9005;
      settings = { };
      tlsCertificatePath = "/var/lib/internal-ca/certs/home-wildcard.crt";
      tlsCertificateKeyPath = "/var/lib/internal-ca/private/home-wildcard.key";
      nginxEnabled = true;
      unboundEnabled = true;
      sopsEnabled = true;
      settingsFormat = pkgs.formats.json { };
      gatewayConfigFile = settingsFormat.generate "openclaw.json" (
        lib.recursiveUpdate {
          gateway = {
            mode = "local";
            bind = "loopback";
            port = port;
          };
        } settings
      );
    in
    {
      sops.secrets.openclaw-bot-token = lib.mkIf (cfg.enable && sopsEnabled) {
        sopsFile = ../../../assets/secrets/bot_token.env;
        format = "dotenv";
      };

      environment.systemPackages = lib.mkIf cfg.enable (
        with pkgs;
        [
          openclaw
        ]
      );

      systemd.services.openclaw-gateway = lib.mkIf cfg.enable {
        description = "Openclaw gateway";
        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];
        environment = {
          OPENCLAW_CONFIG_PATH = "/var/lib/openclaw/openclaw.json";
          OPENCLAW_STATE_DIR = "/var/lib/openclaw";
        };
        serviceConfig = {
          Type = "simple";
          StateDirectory = "openclaw";
          StateDirectoryMode = "0750";
          WorkingDirectory = "/var/lib/openclaw";
          ExecStartPre = [
            "${pkgs.coreutils}/bin/install -m 0640 ${gatewayConfigFile} /var/lib/openclaw/openclaw.json"
          ];
          ExecStart = "${pkgs.openclaw}/bin/openclaw gateway --allow-unconfigured";
          EnvironmentFile = lib.optionals sopsEnabled [
            config.sops.secrets.openclaw-bot-token.path
          ];
          Restart = "always";
          RestartSec = "5s";
        };
      };

      services.nginx.virtualHosts.openclaw = lib.mkIf (cfg.enable && nginxEnabled) {
        serverName = "openclaw.home";
        addSSL = true;
        sslCertificate = tlsCertificatePath;
        sslCertificateKey = tlsCertificateKeyPath;
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString port}";
          proxyWebsockets = true;
        };
      };

      services.unbound.settings.server.local-data = lib.mkIf (cfg.enable && unboundEnabled) [
        ''"openclaw.home. A 127.0.0.1"''
      ];

    };}
