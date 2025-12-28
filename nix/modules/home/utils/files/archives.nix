{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.utils.files.archives;
in
{
  options.modules.utils.files.archives = {
    enable = lib.mkEnableOption "archive tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      p7zip
      unzip
      zip
      file-roller
    ];
  };
}
