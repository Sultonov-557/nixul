{ lib, pkgs, ... }:
{
  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ alacritty ]);
    };

  home =
    { cfg, ... }:
    {
      programs.alacritty = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable alacritty";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
