{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nginx
  ];

  services.nginx = {
    enable = true;

    virtualHosts = {
      glance = {
        serverName = "glance.home";
        locations."/" = {
          proxyPass = "http://127.0.0.1:8000";
        };
      };
      public = {
        serverName = "public.home";
        root = ../../../../../assets/public;
        locations."/" = {
          tryFiles = "$uri =404";
        };
      };

    };
  };
}
