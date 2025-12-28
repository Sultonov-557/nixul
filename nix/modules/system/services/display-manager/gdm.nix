{ lib, config, pkgs, ... }:
let cfg = config.modules.system.services.desktop.displayManager;
in {
  options.modules.system.services.desktop.displayManager = {
    gdm.enable = lib.mkEnableOption "GDM display manager";
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.gdm.enable { services.displayManager.gdm.enable = true; })
  ];
}
