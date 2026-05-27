{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ vlc ]);
    };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ vlc ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable vlc";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
