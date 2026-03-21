{ lib, pkgs, ... }:
{
  home =
    { cfg, inputs, ... }:
    {
      imports = [ inputs.xmcl.homeModules.xmcl ];

      programs.xmcl = lib.mkIf cfg.enable {
        enable = true;
        commandLineArgs = [ ''--password-store="gnome-libsecret"'' ];
        jres = [
          pkgs.jre8
          pkgs.temurin-jre-bin-17
          pkgs.temurin-jre-bin-21
        ];
      };
    };}
