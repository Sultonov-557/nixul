{
  meta = {
    scope = "user";
    system = false;
    hm = true;
  };

  home =
    { ... }:
    {
      programs.ghostty = {
        enable = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
        clearDefaultKeybinds = true;

        settings = {
          font-family = "JetBrainsMono Nerd Font";
          font-size = 12;

          window-decoration = false;
          window-padding-x = 8;
          window-padding-y = 8;

          cursor-style = "block";
          cursor-style-blink = true;

          shell-integration-features = "cursor,sudo,title";

          confirm-close-surface = false;
          copy-on-select = true;

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
}
