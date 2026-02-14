{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ nginx ];
  services.nginx = {
    enable = true;
    recommendedBrotliSettings = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts = {
      public = {
        serverName = "public.home";
        addSSL = true;
        enableACME = true;
        root = ../../../assets/public;
        locations."/" = {
          tryFiles = "$uri =404";
        };
      };
    };
  };
}
