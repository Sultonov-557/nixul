{ lib, pkgs, ... }:
{
  metadata = {
    name = "screenshots";
    description = "Module for `desktop.components.screenshots`.";
    purpose = "Configure `desktop.components.screenshots` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "desktop"
      "components"
      "screenshots"
    ];
  };

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
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable screenshots";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
