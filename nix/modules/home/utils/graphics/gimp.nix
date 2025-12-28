{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.utils.graphics.gimp;
in
{
  options.modules.utils.graphics.gimp = {
    enable = lib.mkEnableOption "gimp";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ gimp ];
  };
}
