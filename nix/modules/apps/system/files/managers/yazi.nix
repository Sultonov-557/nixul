{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.yazi.enable = lib.mkIf cfg.enable true;
      environment.systemPackages = lib.mkIf cfg.enable (
        with pkgs;
        [
          yazi
          ueberzugpp
        ]
      );
    };

  home =
    { cfg, ... }:
    {
      programs.yazi.enable = lib.mkIf cfg.enable true;
      home.packages = lib.mkIf cfg.enable (
        with pkgs;
        [
          yazi
          ueberzugpp
        ]
      );
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable yazi";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
