{
  wayland.windowManager.hyprland.settings = {
    # Modifier keys
    "$mod" = "SUPER";
    "$shiftMod" = "SUPER_SHIFT";
    "$ctrlMod" = "CTRL_SUPER";

    # Caelestia-shell launcher

    bindin = [
      "$mod, mouse:272, global, caelestia:launcherInterrupt"
      "$mod, mouse:273, global, caelestia:launcherInterrupt"
    ];

    bindl = [
      "$ctrlMod, C, global, caelestia:clearNotifs"
      ", XF86AudioPlay, global, caelestia:mediaToggle"
      ", XF86AudioPause, global, caelestia:mediaToggle"
      ", XF86AudioNext, global, caelestia:mediaNext"
      ", XF86AudioPrev, global, caelestia:mediaPrev"
      ", XF86AudioStop, global, caelestia:mediaStop"

      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      "$shiftMod, M, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", Print, global, caelestia:screenshot"
    ];

    bindle = [
      ", XF86MonBrightnessUp, global, caelestia:brightnessUp"
      ", XF86MonBrightnessDown, global, caelestia:brightnessDown"

      ", XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ];

    bind = [
      "$mod, SPACE, global, caelestia:launcher"
      "$ctrlMod SHIFT, L, global, caelestia:session"
      "$mod SHIFT, L, global, caelestia:lock"
      "$mod SHIFT, P, global, caelestia:showall"

      # Media controls
      "$ctrlMod, Space, global, caelestia:mediaToggle"
      "$ctrlMod, Equal, global, caelestia:mediaNext"
      "$ctrlMod, Minus, global, caelestia:mediaPrev"
      "$shiftMod, S, global, caelestia:screenshotFreeze"
      "$shiftMod ALT, S, global, caelestia:screenshot"
      "$shiftMod, C, exec, hyprpicker -a"

      "$mod, Return, exec, ghostty"
      "$mod, E, exec, nautilus"
      "$mod, B, exec, firefox"

      # Focus
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      # Move windows
      "$shiftMod, left, movewindow, l"
      "$shiftMod, right, movewindow, r"
      "$shiftMod, up, movewindow, u"
      "$shiftMod, down, movewindow, d"

      # Window actions
      "$mod, Q, killactive,"
      "$mod, F, fullscreen, 0"
      "$mod, V, togglefloating,"
      "$mod, P, pin,"
      "$ctrlMod, C, centerwindow, 1"

      # Workspace navigation
      "$mod, 1, split-workspace, 1"
      "$mod, 2, split-workspace, 2"
      "$mod, 3, split-workspace, 3"
      "$mod, 4, split-workspace, 4"
      "$mod, 5, split-workspace, 5"
      "$mod, 6, split-workspace, 6"
      "$mod, 7, split-workspace, 7"
      "$mod, 8, split-workspace, 8"
      "$mod, 9, split-workspace, 9"
      "$mod, 0, split-workspace, 10"

      # Move window to workspace
      "$shiftMod, 1, split-movetoworkspace, 1"
      "$shiftMod, 2, split-movetoworkspace, 2"
      "$shiftMod, 3, split-movetoworkspace, 3"
      "$shiftMod, 4, split-movetoworkspace, 4"
      "$shiftMod, 5, split-movetoworkspace, 5"
      "$shiftMod, 6, split-movetoworkspace, 6"
      "$shiftMod, 7, split-movetoworkspace, 7"
      "$shiftMod, 8, split-movetoworkspace, 8"
      "$shiftMod, 9, split-movetoworkspace, 9"
      "$shiftMod, 0, split-movetoworkspace, 10"

      # Scratchpad
      "$mod, S, togglespecialworkspace, magic"
      "$shiftMod, S, split-movetoworkspace, special:magic"
    ];

    binde = [
      # Resize windows
      "$mod, Minus, splitratio, -0.1"
      "$mod, Equal, splitratio, 0.1"

      # Workspace cycling
      "$mod, mouse_down, workspace, e-1"
      "$mod, mouse_up, workspace, e+1"
      "$mod, Page_Down, workspace, e-1"
      "$mod, Page_Up, workspace, e+1"
    ];

    # Mouse bindings
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

  };
}
