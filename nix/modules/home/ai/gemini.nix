{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.ai.gemini;
in
{
  options.modules.ai.gemini = {
    enable = lib.mkEnableOption "gemini-cli";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ gemini-cli ];
  };
}
