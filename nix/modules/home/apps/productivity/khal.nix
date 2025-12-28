{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.apps.productivity.khal;
in
{
  options.modules.apps.productivity.khal = {
    enable = lib.mkEnableOption "khal";
  };

  config = lib.mkIf cfg.enable {
    programs.khal = {
      enable = true;
    };

    home.packages = with pkgs; [ khal ];
  };
}
