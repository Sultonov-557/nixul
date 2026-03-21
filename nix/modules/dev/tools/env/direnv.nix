{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.direnv = lib.mkIf cfg.enable {
        enable = true;
        nix-direnv.enable = true;
      };
    };}
