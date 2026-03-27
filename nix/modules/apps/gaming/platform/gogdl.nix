{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable [ pkgs.gogdl ];
    };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable [ pkgs.gogdl ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable gogdl";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
