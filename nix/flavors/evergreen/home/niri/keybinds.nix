{
  programs.niri.settings.binds = {
    # Caelestia-shell launcher
    "Mod+Space" = { action.spawn = ["caelestia-launcher"]; };
    "Ctrl+Mod+Shift+L" = { action.spawn = ["caelestia-session"]; };
    "Mod+Shift+L" = { action.spawn = ["caelestia-lock"]; };
    "Mod+Shift+P" = { action.spawn = ["caelestia-showall"]; };

    # Media controls
    "Ctrl+Mod+Space" = { action.spawn = ["caelestia-media-toggle"]; };
    "Ctrl+Mod+Equal" = { action.spawn = ["caelestia-media-next"]; };
    "Ctrl+Mod+Minus" = { action.spawn = ["caelestia-media-prev"]; };
    "Ctrl+Mod+C" = { action.spawn = ["caelestia-clear-notifs"]; };

    # Audio controls
    "XF86AudioPlay" = { action.spawn = ["caelestia-media-toggle"]; };
    "XF86AudioPause" = { action.spawn = ["caelestia-media-toggle"]; };
    "XF86AudioNext" = { action.spawn = ["caelestia-media-next"]; };
    "XF86AudioPrev" = { action.spawn = ["caelestia-media-prev"]; };
    "XF86AudioStop" = { action.spawn = ["caelestia-media-stop"]; };
    "XF86AudioMute" = { 
      allow-when-locked = true;
      action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"]; 
    };
    "Shift+Mod+M" = { action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"]; };
    "XF86AudioRaiseVolume" = { 
      allow-when-locked = true;
      action.spawn = ["sh" "-c" "wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"]; 
    };
    "XF86AudioLowerVolume" = { 
      allow-when-locked = true;
      action.spawn = ["sh" "-c" "wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"]; 
    };

    # Brightness controls
    "XF86MonBrightnessUp" = { action.spawn = ["caelestia-brightness-up"]; };
    "XF86MonBrightnessDown" = { action.spawn = ["caelestia-brightness-down"]; };

    # Screenshots
    "Print" = { action.spawn = ["caelestia-screenshot"]; };
    "Shift+Mod+S" = { action.spawn = ["caelestia-screenshot-freeze"]; };
    "Shift+Mod+Alt+S" = { action.spawn = ["caelestia-screenshot"]; };
    "Shift+Mod+C" = { action.spawn = ["hyprpicker" "-a"]; };

    # Application launchers
    "Mod+Return" = { action.spawn = ["ghostty"]; };
    "Mod+E" = { action.spawn = ["nautilus"]; };
    "Mod+B" = { action.spawn = ["firefox"]; };

    # Focus navigation
    "Mod+Left" = { action.focus-column-left = []; };
    "Mod+Right" = { action.focus-column-right = []; };
    "Mod+Up" = { action.focus-window-up = []; };
    "Mod+Down" = { action.focus-window-down = []; };

    # Move windows
    "Shift+Mod+Left" = { action.move-column-left = []; };
    "Shift+Mod+Right" = { action.move-column-right = []; };
    "Shift+Mod+Up" = { action.move-window-up = []; };
    "Shift+Mod+Down" = { action.move-window-down = []; };

    # Window actions
    "Mod+Q" = { action.close-window = []; };
    "Mod+F" = { action.fullscreen-window = []; };
    "Mod+V" = { action.set-window-height = { modifier = "floating"; }; };
    "Mod+P" = { action.spawn = ["niri" "msg" "action" "toggle-window-floating"]; };
    "Ctrl+Mod+C" = { action.center-column = []; };

    # Workspace navigation (1-10)
    "Mod+1" = { action.focus-workspace = 1; };
    "Mod+2" = { action.focus-workspace = 2; };
    "Mod+3" = { action.focus-workspace = 3; };
    "Mod+4" = { action.focus-workspace = 4; };
    "Mod+5" = { action.focus-workspace = 5; };
    "Mod+6" = { action.focus-workspace = 6; };
    "Mod+7" = { action.focus-workspace = 7; };
    "Mod+8" = { action.focus-workspace = 8; };
    "Mod+9" = { action.focus-workspace = 9; };
    "Mod+0" = { action.focus-workspace = 10; };

    # Move window to workspace
    "Shift+Mod+1" = { action.move-window-to-workspace = 1; };
    "Shift+Mod+2" = { action.move-window-to-workspace = 2; };
    "Shift+Mod+3" = { action.move-window-to-workspace = 3; };
    "Shift+Mod+4" = { action.move-window-to-workspace = 4; };
    "Shift+Mod+5" = { action.move-window-to-workspace = 5; };
    "Shift+Mod+6" = { action.move-window-to-workspace = 6; };
    "Shift+Mod+7" = { action.move-window-to-workspace = 7; };
    "Shift+Mod+8" = { action.move-window-to-workspace = 8; };
    "Shift+Mod+9" = { action.move-window-to-workspace = 9; };
    "Shift+Mod+0" = { action.move-window-to-workspace = 10; };

    # Scratchpad (using workspace 99 as a scratchpad alternative)
    "Mod+S" = { action.focus-workspace = 99; };
    "Shift+Mod+S" = { action.move-window-to-workspace = 99; };

    # Resize windows (column width)
    "Mod+Minus" = { action.set-column-width = "-10%"; };
    "Mod+Equal" = { action.set-column-width = "+10%"; };

    # Workspace cycling with scroll
    "Mod+WheelScrollDown" = { 
      action.focus-workspace-down = [];
      cooldown-ms = 150;
    };
    "Mod+WheelScrollUp" = { 
      action.focus-workspace-up = [];
      cooldown-ms = 150;
    };
    "Mod+Page_Down" = { action.focus-workspace-down = []; };
    "Mod+Page_Up" = { action.focus-workspace-up = []; };

    # Mouse bindings for moving and resizing
    "Mod+BtnLeft" = { action.move-window = []; };
    "Mod+BtnRight" = { action.resize-window = []; };
  };
}
