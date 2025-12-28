{
  lib,
  config,
  ...
}:
let
  cfg = config.modules.terminal.emulators.foot;
in
{
  options.modules.terminal.emulators.foot = {
    enable = lib.mkEnableOption "foot";
  };

  config = lib.mkIf cfg.enable {
    programs.foot = {
      enable = true;

      settings = {
        cursor = {
          style = "block";
          blink = "yes";
        };
      };
    };
  };
}
