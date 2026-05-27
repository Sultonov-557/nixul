{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.steam.enable = lib.mkIf cfg.enable true;
    };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable [ pkgs.steam ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable steam";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
