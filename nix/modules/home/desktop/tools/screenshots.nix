{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.desktop.tools.screenshots;
in
{
  options.modules.desktop.tools.screenshots = {
    enable = lib.mkEnableOption "screenshots";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      grim
      slurp
      swappy
      wl-clipboard
    ];

    home.file.".local/bin/screenshot-full" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash
        grim -g "$(slurp)" - | wl-copy
        notify-send "Screenshot captured" "Copied to clipboard"
      '';
    };

    home.file.".local/bin/screenshot-area" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash
        grim -g "$(slurp)" - | swappy -f -
      '';
    };
  };
}
