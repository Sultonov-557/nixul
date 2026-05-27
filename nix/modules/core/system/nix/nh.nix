{ lib, pkgs, ... }:
let
  nixulCli = import ../../../../nixul/cli { inherit pkgs; };
in
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

      environment.systemPackages = lib.mkIf cfg.enable [ nixulCli ];
    };

  home =
    { cfg, ... }:
    {
      programs.nh = lib.mkIf cfg.enable {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep-since 14d --keep 10";
        flake = "${../../../..}";
      };

      home.packages = lib.mkIf cfg.enable [ nixulCli ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nh";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
