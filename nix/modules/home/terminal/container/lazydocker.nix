{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.terminal.container.lazydocker;
in
{
  options.modules.terminal.container.lazydocker = {
    enable = lib.mkEnableOption "lazydocker";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ lazydocker ];
  };
}
