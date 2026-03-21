{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.lazydocker = lib.mkIf cfg.enable {
        enable = true;
      };
    };}
