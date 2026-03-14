{ lib, config, ... }:
{
  home =
    { cfg, osConfig, ... }:
    let
      palette = osConfig.nixul.theme.colors.palette;
    in
    {
      programs.ghostty = lib.mkIf cfg.enable {
        enable = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
        clearDefaultKeybinds = true;

        settings = {
          font-family = config.nixul.theme.fonts.monospace.name;
          font-size = config.nixul.theme.fonts.size;

          window-decoration = false;
          window-padding-x = 8;
          window-padding-y = 8;

          cursor-style = "block";
          cursor-style-blink = true;

          shell-integration-features = "cursor,sudo,title";

          confirm-close-surface = false;
          copy-on-select = true;

          background = "#${palette.base00}";
          foreground = "#${palette.base05}";
          selection-background = "#${palette.base02}";
          selection-foreground = "#${palette.base05}";
          cursor-color = "#${palette.base05}";

          palette = [
            "0=#${palette.base00}"
            "1=#${palette.base08}"
            "2=#${palette.base0B}"
            "3=#${palette.base0A}"
            "4=#${palette.base0D}"
            "5=#${palette.base0E}"
            "6=#${palette.base0C}"
            "7=#${palette.base05}"
            "8=#${palette.base03}"
            "9=#${palette.base08}"
            "10=#${palette.base0B}"
            "11=#${palette.base0A}"
            "12=#${palette.base0D}"
            "13=#${palette.base0E}"
            "14=#${palette.base0C}"
            "15=#${palette.base07}"
          ];

          keybind = [
            "ctrl+shift+c=copy_to_clipboard"
            "ctrl+shift+v=paste_from_clipboard"
            "copy=copy_to_clipboard"
            "paste=paste_from_clipboard"
            "ctrl+==increase_font_size:1"
            "ctrl+-=decrease_font_size:1"
          ];
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable ghostty";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
