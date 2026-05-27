{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ katana ]);
    };
  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ katana ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable katana";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
