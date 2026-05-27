{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ dnsx ]);
    };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ dnsx ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable dnsx";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
