{ ... }:
{
  programs.ghostty = {
    enable = true;
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
      ];
    };
  };
}
