{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.utils.database.dbeaver;
in
{
  options.modules.utils.database.dbeaver = {
    enable = lib.mkEnableOption "dbeaver";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ dbeaver-bin ];
  };
}
