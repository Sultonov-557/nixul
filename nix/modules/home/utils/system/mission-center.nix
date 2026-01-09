{ lib, config, pkgs, ... }:
let cfg = config.modules.utils.system.mission-center;
in {
  options.modules.utils.system.mission-center = {
    enable = lib.mkEnableOption "mission-center";
  };

  config =
    lib.mkIf cfg.enable { home.packages = with pkgs; [ mission-center ]; };
}
