{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.zed-editor = lib.mkIf cfg.enable {
        enable = true;
      };
    };}
