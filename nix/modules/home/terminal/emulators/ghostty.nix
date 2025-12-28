{
  lib,
  config,
  ...
}:
let
  cfg = config.modules.terminal.emulators.ghostty;
in
{
  options.modules.terminal.emulators.ghostty = {
    enable = lib.mkEnableOption "ghostty";
  };

  config = lib.mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
      clearDefaultKeybinds = true;

      settings = {
        font-family = "JetBrainsMono Nerd Font";
        font-size = 12;

        window-decoration = true;
        window-padding-x = 8;
        window-padding-y = 8;

        cursor-style = "block";
        cursor-style-blink = true;

        shell-integration = "zsh";
        shell-integration-features = "cursor,sudo,title";

        confirm-close-surface = false;
        copy-on-select = true;

        keybind = [
          "ctrl+shift+c=copy_to_clipboard"
          "ctrl+shift+v=paste_from_clipboard"
          "ctrl+shift+t=new_tab"
          "ctrl+shift+w=close_surface"
          "ctrl+shift+n=new_window"
          "copy=copy_to_clipboard"
          "paste=paste_from_clipboard"
          "ctrl+==increase_font_size:1"
          "ctrl+-=decrease_font_size:1"
        ];
      };
    };
  };
}
