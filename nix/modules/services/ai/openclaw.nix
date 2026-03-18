{ lib, ... }:
{

  system =
    {
      cfg,
      config,
      pkgs,
      nixul,
      ...
    }:
    let
      port = cfg.port or 9005;
      settings = cfg.settings or { };
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
      sopsEnabled = lib.attrByPath [
        "host"
        "modules"
        "core"
        "security"
        "secrets"
        "sops"
        "enable"
      ] false nixul;
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
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString port}";
          proxyWebsockets = true;
        };
      };

      services.unbound.settings.server.local-data = lib.mkIf (cfg.enable && unboundEnabled) [
        ''"openclaw.home. A 127.0.0.1"''
      ];

      assertions = [
        {
          assertion = (!cfg.enable) || nginxEnabled;
          message = "services.ai.openclaw requires services.server.nginx.enable = true";
        }
        {
          assertion = (!cfg.enable) || unboundEnabled;
          message = "services.ai.openclaw requires core.security.network.unbound.enable = true";
        }
        {
          assertion = (!cfg.enable) || sopsEnabled;
          message = "services.ai.openclaw requires core.security.secrets.sops.enable = true";
        }
      ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable openclaw";
        };

        port = lib.mkOption {
          type = lib.types.port;
          default = 9005;
          description = "Openclaw gateway port";
        };

        settings = lib.mkOption {
          type = lib.types.attrsOf lib.types.anything;
          default = { };
          description = "Additional Openclaw JSON config merged into generated config";
        };
      };
    };
    default = {
      enable = false;
      port = 9005;
      settings = { };
    };
  };
}
