{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.ntfy-sh = lib.mkIf cfg.enable {
        enable = true;
        settings = {
          base-url = "http://ntfy.sh";
        };
      };
    };}
