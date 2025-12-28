{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.terminal.runtime.bun;
in
{
  options.modules.terminal.runtime.bun = {
    enable = lib.mkEnableOption "bun";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ bun ];
  };
}
