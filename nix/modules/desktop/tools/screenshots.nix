{ pkgs, config, ... }:
{

  home-manager.users.${config.nixul.user} = {

    home = {
      packages = with pkgs; [
        grim
        slurp
        swappy
        wl-clipboard
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
  };
}
