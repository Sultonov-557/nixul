{
  wayland.windowManager.hyprland.settings = {
    # Modifier keys
    "$mod" = "SUPER";
    "$shiftMod" = "SUPER_SHIFT";
    "$ctrlMod" = "CTRL_SUPER";

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
      "$mod, SPACE, exec, dms ipc call spotlight toggle"
      "$mod SHIFT, L, exec, dms ipc call lock lock"

      # Media controls
      "$ctrlMod, Space, global, caelestia:mediaToggle"
      "$ctrlMod, Equal, global, caelestia:mediaNext"
      "$ctrlMod, Minus, global, caelestia:mediaPrev"
      "$shiftMod, S, global, caelestia:screenshotFreeze"
      "$shiftMod ALT, S, global, caelestia:screenshot"
      "$shiftMod, C, exec, hyprpicker -a"

      "$mod, Return, exec, kitty"
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
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      # Move window to workspace
      "$shiftMod, 1, movetoworkspace, 1"
      "$shiftMod, 2, movetoworkspace, 2"
      "$shiftMod, 3, movetoworkspace, 3"
      "$shiftMod, 4, movetoworkspace, 4"
      "$shiftMod, 5, movetoworkspace, 5"
      "$shiftMod, 6, movetoworkspace, 6"
      "$shiftMod, 7, movetoworkspace, 7"
      "$shiftMod, 8, movetoworkspace, 8"
      "$shiftMod, 9, movetoworkspace, 9"
      "$shiftMod, 0, movetoworkspace, 10"

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
    bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];

  };
}
