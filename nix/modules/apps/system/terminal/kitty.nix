{ lib, ... }:
{
  metadata = {
    name = "kitty";
    description = "Module for `apps.system.terminal.kitty`.";
    purpose = "Configure `apps.system.terminal.kitty` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "apps"
      "system"
      "terminal"
      "kitty"
    ];
  };

  home =
    { cfg, osConfig, ... }:
    let
      palette = osConfig.nixul.theme.colors.palette;
    in
    {
      programs.kitty = lib.mkIf cfg.enable {
        enable = true;
        shellIntegration = {
          enableZshIntegration = true;
          enableFishIntegration = true;
        };

        settings = {
          font_family = osConfig.nixul.theme.fonts.monospace.name;
          font_size = osConfig.nixul.theme.fonts.monospace.size;

          background = "#${palette.base00}";
          foreground = "#${palette.base05}";
          selection_background = "#${palette.base02}";
          selection_foreground = "#${palette.base05}";
          url_color = "#${palette.base04}";
          cursor = "#${palette.base05}";
          active_border_color = "#${palette.base03}";
          inactive_border_color = "#${palette.base01}";
          active_tab_background = "#${palette.base00}";
          active_tab_foreground = "#${palette.base05}";
          inactive_tab_background = "#${palette.base01}";
          inactive_tab_foreground = "#${palette.base04}";
          tab_bar_background = "#${palette.base01}";

          color0 = "#${palette.base00}";
          color1 = "#${palette.base08}";
          color2 = "#${palette.base0B}";
          color3 = "#${palette.base0A}";
          color4 = "#${palette.base0D}";
          color5 = "#${palette.base0E}";
          color6 = "#${palette.base0C}";
          color7 = "#${palette.base05}";
          color8 = "#${palette.base03}";
          color9 = "#${palette.base08}";
          color10 = "#${palette.base0B}";
          color11 = "#${palette.base0A}";
          color12 = "#${palette.base0D}";
          color13 = "#${palette.base0E}";
          color14 = "#${palette.base0C}";
          color15 = "#${palette.base07}";

          enable_audio_bell = false;
          confirm_os_window_close = 0;
        };

        keybindings = {
          "Ctrl+Shift+T" = "";
          "Ctrl+Shift+W" = "";
          "Ctrl+Shift+Left" = "";
          "Ctrl+Shift+Right" = "";
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable kitty";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
