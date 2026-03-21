{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.fail2ban = lib.mkIf cfg.enable {
        enable = true;
      };
    };}
