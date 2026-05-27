{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ via ]);
    };
  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ via ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable via";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
