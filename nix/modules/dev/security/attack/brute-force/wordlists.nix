{ lib, pkgs, ... }:
{
  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (
        with pkgs;
        [
          wordlists
          seclists
          payloadsallthethings
        ]
      );
    };
  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (
        with pkgs;
        [
          wordlists
          seclists
          payloadsallthethings
        ]
      );
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable wordlists";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
