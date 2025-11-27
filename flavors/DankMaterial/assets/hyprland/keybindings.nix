{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod SHIFT, mouse:272, resizewindow"
    ];

    bind = [
      # Application launchers
      "$mod, Space, exec, dms ipc call spotlight toggle"
      "$mod SHIFT, Space, exec, vicinae toggle"
      "$mod, V, exec, dms ipc call clipboard toggle"
      "$mod, Return, exec, ghostty"
      "$mod, W, exec, zen"
      "$mod, E, exec, dolphin"
      "$mod, M, exec, yandex-music"
      "$mod, T, exec, Telegram"
      "$mod, D, exec, vesktop"
      "$mod, G, exec, lutris"
      "$mod, L, exec, dms ipc call lock lock"

      # Window management
      "$mod, Q, killactive"
      "$mod, F, togglefloating"
      "$mod SHIFT, F, fullscreen"
      #"$mod, Grave, hyprexpo:expo, toggle"

      # Focus movement
      "$mod, Left, movefocus, l"
      "$mod, Down, workspace, e+1"
      "$mod, Up, workspace, e-1"
      "$mod, Right, movefocus, r"
      "$mod, H, movefocus, l"
      "$mod, J, workspace, e+1"
      "$mod, K, workspace, e-1"
      "$mod, Semicolon, movefocus, r"

      # Window movement
      "$mod SHIFT, Left, movewindow, l"
      "$mod SHIFT, Down, movetoworkspace, e+1"
      "$mod SHIFT, Up, movetoworkspace, e-1"
      "$mod SHIFT, Right, movewindow, r"
      "$mod SHIFT, H, movewindow, l"
      "$mod SHIFT, J, movetoworkspace, e+1"
      "$mod SHIFT, K, movetoworkspace, e-1"
      "$mod SHIFT, Semicolon, movewindow, r"

      # Workspaces
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"

      # Move to workspace
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"

      # Window resizing
      "$mod, R, togglesplit"
    ];

    binde = [
      # Volume keys (repeatable)
      ", XF86AudioRaiseVolume, exec, pamixer -i 5"
      ", XF86AudioLowerVolume, exec, pamixer -d 5"

      # Brightness keys (repeatable)
      ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

      # Window resizing (repeatable)
      "$mod, Minus, resizeactive, -100 0"
      "$mod, Equal, resizeactive, 100 0"
    ];

    bindl = [
      # Media keys (locked)
      ", XF86AudioMute, exec, dms ipc call audio mute"
      ", XF86AudioMicMute, exec, dms ipc call audio micmute"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioStop, exec, playerctl stop"

      # Screenshots
      ", Print, exec, grim -g \"$(slurp)\" - | swappy -f -"
    ];
  };
}
