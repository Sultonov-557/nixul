{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.apps.communication.thunderbird;
in
{
  options.modules.apps.communication.thunderbird = {
    enable = lib.mkEnableOption "thunderbird";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ thunderbird ];
  };
}
