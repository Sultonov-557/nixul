{ lib, pkgs, ... }:
{

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable [ pkgs.lutris ];

      #TODO: remove this when lutris is fixed
      nixpkgs.overlays = [
        (_: prev: {
          openldap = prev.openldap.overrideAttrs {
            doCheck = !prev.stdenv.hostPlatform.isi686;
          };
        })
      ];
    };

  home =
    { cfg, ... }:
    {
      programs.lutris.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable lutris";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
