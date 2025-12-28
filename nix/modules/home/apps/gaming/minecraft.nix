{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.apps.gaming.minecraft;
in
{
  imports = [ inputs.xmcl.homeModules.xmcl ];

  options.modules.apps.gaming.minecraft = {
    enable = lib.mkEnableOption "minecraft (xmcl)";
  };

  config = lib.mkIf cfg.enable {
    programs.xmcl = {
      enable = true;
      commandLineArgs = [ ''--password-store="gnome-libsecret"'' ];
      jres = [
        pkgs.jre8
        pkgs.temurin-jre-bin-17
        pkgs.temurin-jre-bin-21
      ];
    };
  };
}
