{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.apps.productivity.obsidian;
in
{
  options.modules.apps.productivity.obsidian = {
    enable = lib.mkEnableOption "obsidian";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ obsidian ];
  };
}
