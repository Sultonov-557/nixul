{
  lib,
  config,
  ...
}:
let
  cfg = config.modules.utils.system.btop;
in
{
  options.modules.utils.system.btop = {
    enable = lib.mkEnableOption "btop";
  };

  config = lib.mkIf cfg.enable {
    programs.btop = {
      enable = true;
      settings = {
        theme_background = false;
        vim_keys = true;
      };
    };
  };
}
