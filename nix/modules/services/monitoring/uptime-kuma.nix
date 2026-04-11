{
  lib,
  pkgs,
  ...
}:
{
  system =
    { cfg, nixul, ... }:
    let
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
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ uptime-kuma ]);

      services.uptime-kuma = lib.mkIf cfg.enable {
        enable = true;
        settings = {
          PORT = "9007";
        };
      };

      services.unbound.settings.server.local-data = lib.mkIf (cfg.enable && unboundEnabled) [
        ''"uptime.home. A 127.0.0.1"''
      ];

      services.nginx.virtualHosts.uptime-kuma = lib.mkIf (cfg.enable && nginxEnabled) {
        serverName = "uptime.home";
        addSSL = true;
        sslCertificate = "/var/lib/internal-ca/certs/home-wildcard.crt";
        sslCertificateKey = "/var/lib/internal-ca/private/home-wildcard.key";
        locations."/" = {
          proxyPass = "http://127.0.0.1:9007";
        };
     };

      assertions = [
        {
          assertion = (!cfg.enable) || nginxEnabled;
          message = "services.monitoring.uptime-kuma requires services.server.nginx.enable = true";
        }
        {
          assertion = (!cfg.enable) || unboundEnabled;
          message = "services.monitoring.uptime-kuma requires core.security.network.unbound.enable = true";
        }
      ];
    };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ uptime-kuma ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable uptime-kuma";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
