{
  lib,
  pkgs,
  config,
  ...
}:
let
  mkSections = import ../../lib/bookmarks-dashy.nix { inherit lib; };
in
{
  system =
    { cfg, ... }:
    let
      sections = mkSections config.nixul.host.bookmarks;
      tlsCertificatePath = "/var/lib/internal-ca/certs/home-wildcard.crt";
      tlsCertificateKeyPath = "/var/lib/internal-ca/private/home-wildcard.key";
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
            logo = "https://public.home/logo.png";
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

      services.unbound.settings.server.local-data = lib.mkIf cfg.enable [
        ''"dashy.home. A 127.0.0.1"''
      ];

      services.nginx.virtualHosts.dashy = lib.mkIf cfg.enable {
        addSSL = true;
        sslCertificate = tlsCertificatePath;
        sslCertificateKey = tlsCertificateKeyPath;
      };

    };}
