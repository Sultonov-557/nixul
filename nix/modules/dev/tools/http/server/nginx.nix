{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    nginx
  ];

  services.nginx = {
    enable = true;
    recommendedBrotliSettings = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts = {
      glance = {
        serverName = "dashboard.home";
        addSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:9999";
        };
      };
      dashy = {
        serverName = "dashy.home";
        addSSL = true;
        enableACME = true;
        root = config.services.dashy.finalDrv;
        locations."/" = {
          tryFiles = "$uri /index.html";
        };
      };
      public = {
        serverName = "public.home";
        addSSL = true;
        enableACME = true;
        root = ../../../../../assets/public;
        locations."/" = {
          tryFiles = "$uri =404";
        };
      };
    };
  };
}
