{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # Float rules
      "float, class:^(pavucontrol)$"
      "float, class:^(nm-connection-editor)$"
      "float, class:^(blueman-manager)$"
      "float, title:^(Picture-in-Picture)$"

      # Opacity rules for terminals
      "opacity 0.92 0.85, class:^(ghostty)$"
      "opacity 0.92 0.85, class:^(kitty)$"
      "opacity 0.92 0.85, class:^(alacritty)$"

      # Opacity for code editors
      "opacity 0.95 0.90, class:^(code)$"
      "opacity 0.95 0.90, class:^(VSCodium)$"

      # Pin picture-in-picture
      "pin, title:^(Picture-in-Picture)$"
      "keepaspectratio, title:^(Picture-in-Picture)$"

      # Dialog windows
      "float, class:^(.*),title:^(Open File)$"
      "float, class:^(.*),title:^(Save File)$"
    ];

    layerrule = [
      "blur, caelestia"
      "ignorezero, caelestia"
    ];
  };
}
