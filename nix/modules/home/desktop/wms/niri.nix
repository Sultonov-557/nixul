{
  inputs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.desktop.wms.niri;
in
{
  imports = [ inputs.niri.homeModules.niri ];

  options.modules.desktop.wms.niri = {
    enable = lib.mkEnableOption "niri";
    settings = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      description = "Niri settings";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.niri = {
      enable = true;
      settings = cfg.settings;
    };
  };
}
