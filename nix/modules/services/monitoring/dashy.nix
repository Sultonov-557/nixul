{
  lib,
  pkgs,
  config,
  ...
}:
let
  mkSections = import ../../../nixul/universal/bookmarks/adapters/dashy { inherit lib; };
in
{
  system =
    { cfg, ... }:
    let
      sections = mkSections config.nixul.host.bookmarks;
    in
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ dashy-ui ]);

      services.dashy = lib.mkIf cfg.enable {
        enable = true;

        virtualHost = {
          enableNginx = true;
          domain = "dashy.home";
        };

        settings = {
          pageInfo = {
            title = "Home";
            logo = "http://public.home/logo.png";
          };
          sections = sections;

          appConfig = {
            startingView = "minimal";
            theme = "glass";
            webSearch = {
              searchEngine = "google";
            };
            statusCheck = true;

            hideComponents = {
              hideFooter = true;
            };
            preventWriteToDisk = true;
            preventLocalSave = true;
            disableConfiguration = false;
            showSplashScreen = true;

            customCss = ''
              body {
               background:transparent !important;
              }'';
          };
        };
      };

      services.unbound.settings.server.local-data =
        lib.mkIf (cfg.enable && config.nixul.host.modules.core.security.network.unbound.enable)
          [
            ''"dashy.home. A 127.0.0.1"''
          ];

      assertions = [
        {
          assertion = (!cfg.enable) || config.nixul.host.modules.services.server.nginx.enable;
          message = "services.monitoring.dashy requires services.server.nginx.enable = true";
        }
        {
          assertion = (!cfg.enable) || config.nixul.host.modules.core.security.network.unbound.enable;
          message = "services.monitoring.dashy requires core.security.network.unbound.enable = true";
        }
      ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable dashy";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
