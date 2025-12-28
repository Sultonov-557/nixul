{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.utils.system.baobab;
in
{
  options.modules.utils.system.baobab = {
    enable = lib.mkEnableOption "baobab";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ baobab ];
  };
}
