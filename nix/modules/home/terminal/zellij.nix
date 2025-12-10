{ ... }:

{
  programs.zellij = {
    enable = true;

    settings = {
      # Theme
      theme = "catppuccin-mocha";

      # UI preferences
      pane_frames = true;
      mouse_mode = true;
      scroll_buffer_size = 10000;
      copy_on_select = true;

      # Default layout
      default_layout = "compact";

      # Simplified UI
      simplified_ui = false;

      # Session options
      default_shell = "zsh";
      session_serialization = true;

      # Keybindings mode
      default_mode = "normal";
    };
  };
}
