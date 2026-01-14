{ ... }: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;

    settings = {
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
}
