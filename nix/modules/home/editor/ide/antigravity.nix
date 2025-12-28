{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.editor.ide.antigravity;
in
{
  options.modules.editor.ide.antigravity = {
    enable = lib.mkEnableOption "antigravity IDE";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ antigravity ];
  };
}
