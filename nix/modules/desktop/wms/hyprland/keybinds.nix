let
  mod = "SUPER";
in
{
  wayland.windowManager.hyprland.settings = {
    # Keybindings
    bind = [
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      "${mod} SHIFT, M, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

      # Media keys (playerctl)
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPause, exec, playerctl play-pause" # Often same as Play
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioStop, exec, playerctl stop"

      # Niri Specific ported
      "${mod} SHIFT, E, exit," # Exits Hyprland
      ''${mod} SHIFT, S, exec, grim -g "$(slurp)" - | wl-copy'' # Region screenshot
      # -- Applications --
      "${mod}, RETURN, exec, ghostty"
      "${mod}, E, exec, nautilus"
      "${mod}, W, exec, zen-beta"
      "${mod}, T, exec, Telegram"
      "${mod}, M, exec, yandex-music"
      "${mod} SHIFT, C, exec, hyprpicker -a"
      "${mod} SHIFT, V, exec, noctalia-shell ipc call launcher clipboard"
      "${mod}, SPACE, exec, noctalia-shell ipc call launcher toggle"
      "${mod} SHIFT, L, exec, noctalia-shell ipc call lockScreen lock"

      # -- Window Management --
      "${mod}, Q, killactive,"
      "${mod}, F, fullscreen," # Toggles fullscreen on the active window
      "${mod}, V, togglefloating," # Toggles floating mode for the active window

      # -- Focus --
      "${mod}, LEFT, movefocus, l"
      "${mod}, DOWN, movefocus, d"
      "${mod}, UP, movefocus, u"
      "${mod}, RIGHT, movefocus, r"
      # Niri's focus-column-first/last has no direct simple equivalent in Hyprland's master layout

      # -- Move --
      "${mod} SHIFT, LEFT, movewindow, l"
      "${mod} SHIFT, DOWN, movewindow, d"
      "${mod} SHIFT, UP, movewindow, u"
      "${mod} SHIFT, RIGHT, movewindow, r"

      # -- Workspaces --
      "${mod}, 1, workspace, 1"
      "${mod}, 2, workspace, 2"
      "${mod}, 3, workspace, 3"
      "${mod}, 4, workspace, 4"
      "${mod}, 5, workspace, 5"
      "${mod}, 6, workspace, 6"
      "${mod}, 7, workspace, 7"
      "${mod}, 8, workspace, 8"
      "${mod}, 9, workspace, 9"

      "${mod} SHIFT, 1, movetoworkspace, 1"
      "${mod} SHIFT, 2, movetoworkspace, 2"
      "${mod} SHIFT, 3, movetoworkspace, 3"
      "${mod} SHIFT, 4, movetoworkspace, 4"
      "${mod} SHIFT, 5, movetoworkspace, 5"
      "${mod} SHIFT, 6, movetoworkspace, 6"
      "${mod} SHIFT, 7, movetoworkspace, 7"
      "${mod} SHIFT, 8, movetoworkspace, 8"
      "${mod} SHIFT, 9, movetoworkspace, 9"
    ];

    bindm = [
      "${mod}, mouse:272, movewindow"
      "${mod}, mouse:273, resizewindow"
    ];

    # Keybindings with repeated execution (binde)
    binde = [
      # -- Media & System (Standard) --
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-"

      # Brightness keys (brightnessctl)
      ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
    ];

  };
}
