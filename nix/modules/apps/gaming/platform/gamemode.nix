{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.gamemode.enable = lib.mkIf cfg.enable true;
    };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable [ pkgs.gamemode ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable gamemode";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
