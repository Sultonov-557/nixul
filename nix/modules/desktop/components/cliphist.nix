{ lib, pkgs, ... }:
{
  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable [
        pkgs.cliphist
        pkgs.wl-clipboard
      ];

      services.cliphist.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable cliphist";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
