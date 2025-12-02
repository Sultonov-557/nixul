{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind = [
      "$mod, Return, exec, ghostty"
      "$mod SHIFT, Q, killactive"
      "$mod, M, exit"
      "$mod, W, exec, firefox"
      "$mod, E, exec, nautilus"
      "$mod, V, togglefloating"
      "$mod, Space, exec, rofi -show drun"
      "$mod, D, exec, rofi -show drun"
      "$mod, P, pseudo"
      "$mod, J, togglesplit"

      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      "$mod, h, movefocus, l"
      "$mod, l, movefocus, r"
      "$mod, k, movefocus, u"
      "$mod, j, movefocus, d"

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

      "$mod SHIFT, 1,split-movetoworkspace, 1"
      "$mod SHIFT, 2,split-movetoworkspace, 2"
      "$mod SHIFT, 3,split-movetoworkspace, 3"
      "$mod SHIFT, 4,split-movetoworkspace, 4"
      "$mod SHIFT, 5,split-movetoworkspace, 5"
      "$mod SHIFT, 6,split-movetoworkspace, 6"
      "$mod SHIFT, 7,split-movetoworkspace, 7"
      "$mod SHIFT, 8,split-movetoworkspace, 8"
      "$mod SHIFT, 9,split-movetoworkspace, 9"
      "$mod SHIFT, 0,split-movetoworkspace, 10"

      "$mod, S, togglespecialworkspace, magic"
      "$mod SHIFT, S, movetoworkspace, special:magic"

      "$mod, mouse_down, split-workspace, e+1"
      "$mod, mouse_up, split-workspace, e-1"

      ", XF86AudioRaiseVolume, exec, pamixer -i 5"
      ", XF86AudioLowerVolume, exec, pamixer -d 5"
      ", XF86AudioMute, exec, pamixer -t"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"

      ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

      ''$mod SHIFT, 3, exec, grim -g "$(slurp)" - | wl-copy''
      ''$mod SHIFT, 4, exec, grim -g "$(slurp)" - | swappy -f -''
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}
