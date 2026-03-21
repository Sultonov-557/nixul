{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.avahi = lib.mkIf cfg.enable {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };}
