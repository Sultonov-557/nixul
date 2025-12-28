{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.apps.productivity.todoist;
in
{
  options.modules.apps.productivity.todoist = {
    enable = lib.mkEnableOption "todoist";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ todoist-electron ];
  };
}
