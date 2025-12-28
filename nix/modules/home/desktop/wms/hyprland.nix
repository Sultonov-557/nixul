{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.desktop.wms.hyprland;
in
{
  options.modules.desktop.wms.hyprland = {
    enable = lib.mkEnableOption "hyprland (home-manager)";
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;

      xwayland.enable = true;
      systemd.enable = true;

      plugins = [
        inputs.hyprland-virtual-desktops.packages.${pkgs.system}.virtual-desktops
      ];
    };
  };
}
