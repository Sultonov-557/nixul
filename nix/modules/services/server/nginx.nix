{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ nginx ]);
      services.nginx = lib.mkIf cfg.enable {
        enable = true;
        recommendedBrotliSettings = true;
        recommendedGzipSettings = true;
        recommendedOptimisation = true;
        recommendedProxySettings = true;
        recommendedTlsSettings = true;

        virtualHosts = {
          public = {
            serverName = "public.home";
            root = ../../../assets/public;
            locations."/" = {
              tryFiles = "$uri =404";
            };
          };
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nginx";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
