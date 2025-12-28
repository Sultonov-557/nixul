{
  inputs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.apps.communication.discord;
in
{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  options.modules.apps.communication.discord = {
    enable = lib.mkEnableOption "discord";
  };

  config = lib.mkIf cfg.enable {
    programs.nixcord = {
      enable = true;
      config = {
        useQuickCss = true;
        themeLinks = [ ];
        frameless = false;
      };
    };
  };
}
