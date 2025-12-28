{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.ai.cursor;
in
{
  options.modules.ai.cursor = {
    enable = lib.mkEnableOption "cursor-cli";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ cursor-cli ];
  };
}
