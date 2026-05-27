{ lib, pkgs, ... }:
{
  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ yarn ]);
    };
  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ yarn ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable yarn";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
