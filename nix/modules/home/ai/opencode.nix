{ pkgs, lib, config, ... }:
let cfg = config.modules.ai.opencode;
in {
  options.modules.ai.opencode = { enable = lib.mkEnableOption "opencode"; };

  config = lib.mkIf cfg.enable { home.packages = with pkgs; [ opencode ]; };
}
