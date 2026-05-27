{ lib, pkgs, ... }:
{

  system =
    { cfg, ... }:
    {
      programs.ydotool.enable = cfg.enable;
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ ydotool ]);
    };
  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ ydotool ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable ydotool";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
