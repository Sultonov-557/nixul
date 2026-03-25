{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (
        with pkgs;
        [
          winboat
        ]
      );
    };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (
        with pkgs;
        [
          winboat
        ]
      );
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable winboat";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
