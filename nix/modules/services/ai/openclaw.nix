{ lib, ... }:
{

  system =
    {
      cfg,
      pkgs,
      nixul,
      ...
    }:
    {
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
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.openclaw}/bin/openclaw gateway run --port 9005 --allow-unconfigured";
          Restart = "always";
          RestartSec = "5s";
        };
      };

      services.nginx.virtualHosts.openclaw =
        lib.mkIf (cfg.enable && nixul.host.modules.services.server.nginx.enable)
          {
            serverName = "openclaw.home";
            locations."/" = {
              proxyPass = "http://127.0.0.1:9005";
              proxyWebsockets = true;
            };
          };

      services.unbound.settings.server.local-data =
        lib.mkIf (cfg.enable && nixul.host.modules.core.security.network.unbound.enable)
          [
            ''"openclaw.home. A 127.0.0.1"''
          ];

      assertions = [
        {
          assertion = (!cfg.enable) || nixul.host.modules.services.server.nginx.enable;
          message = "services.ai.openclaw requires services.server.nginx.enable = true";
        }
        {
          assertion = (!cfg.enable) || nixul.host.modules.core.security.network.unbound.enable;
          message = "services.ai.openclaw requires core.security.network.unbound.enable = true";
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
      };
    };
    default = {
      enable = false;
    };
  };
}
