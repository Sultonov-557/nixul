{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (
        with pkgs;
        [
          nemo
        ]
      );
    };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (
        with pkgs;
        [
          nemo
        ]
      );
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nemo";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
