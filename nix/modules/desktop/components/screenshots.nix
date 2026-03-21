{ lib, pkgs, ... }:
{
  home =
    { cfg, ... }:
    {
      home = lib.mkIf cfg.enable {
        packages = [
          pkgs.grim
          pkgs.slurp
          pkgs.swappy
          pkgs.wl-clipboard
        ];

        file.".local/bin/screenshot-full" = {
          executable = true;
          text = ''
            #!/usr/bin/env bash
            grim -g "$(slurp)" - | wl-copy
            notify-send "Screenshot captured" "Copied to clipboard"
          '';
        };

        file.".local/bin/screenshot-area" = {
          executable = true;
          text = ''
            #!/usr/bin/env bash
            grim -g "$(slurp)" - | swappy -f -
          '';
        };
      };
    };}
