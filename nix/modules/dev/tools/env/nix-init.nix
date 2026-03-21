{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.nix-init = lib.mkIf cfg.enable {
        enable = true;
      };
    };}
