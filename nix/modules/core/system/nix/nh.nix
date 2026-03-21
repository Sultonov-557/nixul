{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.nh = lib.mkIf cfg.enable {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep-since 14d --keep 10";
        flake = "${../../..}";
      };

    };}
