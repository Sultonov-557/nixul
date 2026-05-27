{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.gamescope.enable = lib.mkIf cfg.enable true;
    };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable [ pkgs.gamescope ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable gamescope";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
