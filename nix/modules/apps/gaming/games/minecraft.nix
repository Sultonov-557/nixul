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
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable minecraft";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
