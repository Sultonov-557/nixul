{ lib, ... }:
{
  home =
    {
      cfg,
      ...
    }:
    {
      programs.btop = lib.mkIf cfg.enable {
        enable = true;
        settings = {
          theme_background = false;
          vim_keys = true;
        };
      };
    };}
