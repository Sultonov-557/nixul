{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.utils.files.documents;
in
{
  options.modules.utils.files.documents = {
    enable = lib.mkEnableOption "document tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ imv ];

    programs.zathura = {
      enable = true;
      options = {
        selection-clipboard = "clipboard";
        adjust-open = "width";
        recolor = false;
      };
    };
  };
}
