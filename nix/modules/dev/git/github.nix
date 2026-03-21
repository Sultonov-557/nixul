{ lib, ... }:
{
  home =
    { cfg, ... }:
    {
      programs.gh = lib.mkIf cfg.enable {
        enable = true;
        gitCredentialHelper = {
          enable = true;
        };
      };
    };}
