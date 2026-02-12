{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nginx
  ];

  services.nginx = {
    enable = true;

    virtualHosts."public.home" = {
      serverName = "public.home";
      root = ../../../../../assets/public;
      locations = {
        "/" = {
          tryFiles = "$uri =404";
        };
      };
    };
  };
}
