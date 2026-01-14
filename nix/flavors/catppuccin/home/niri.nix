{ config, ... }: {
  programs.niri.settings = {
    input = {
      keyboard = {
        xkb = {
          layout = "us";
          options = "grp:win_space_toggle,compose:ralt,ctrl:nocaps";
        };
      };
      touchpad = {
        tap = true;
        natural-scroll = true;
      };
    };

    prefer-no-csd = true;

    layout = {
      gaps = 16;
      center-focused-column = "never";

      default-column-width = { proportion = 1.0; };

      focus-ring = {
        enable = true;
        width = 2;
      };

      border = {
        enable = true;
        width = 2;
      };
    };

    binds = with config.lib.niri.actions; {
      # -- Applications --
      "Mod+Return".action.spawn = "ghostty";
      "Mod+E".action.spawn = "nautilus"; # File Manager
      "Mod+W".action.spawn = "firefox"; # Browser
      "Mod+T".action.spawn = "Telegram"; # Telegram
      "Mod+M".action.spawn = "yandex-music"; # Telegram
      "Mod+Shift+C".action.spawn = [ "hyprpicker" "-a" ]; # Color Picker
      "Mod+Shift+V".action.spawn = "dms ipc call clipboard toggle";

      # DMS / Shell
      "Mod+Space".action.spawn = [ "dms" "ipc" "call" "spotlight" "toggle" ];
      "Mod+Shift+L".action.spawn = [ "dms" "ipc" "call" "lock" "lock" ];

      # -- Window Management --
      "Mod+Q".action = close-window;
      "Mod+F".action = fullscreen-window;
      "Mod+V".action = toggle-window-floating;
      "Mod+Ctrl+C".action = center-column;

      # -- Focus --
      "Mod+Left".action = focus-column-left;
      "Mod+Down".action = focus-window-down;
      "Mod+Up".action = focus-window-up;
      "Mod+Right".action = focus-column-right;

      # -- Move --
      "Mod+Shift+Left".action = move-column-left;
      "Mod+Shift+Down".action = move-window-down;
      "Mod+Shift+Up".action = move-window-up;
      "Mod+Shift+Right".action = move-column-right;

      "Mod+Home".action.focus-column-first = [ ];
      "Mod+End".action.focus-column-last = [ ];
      "Mod+WheelScrollDown".action.focus-column-right = [ ];
      "Mod+WheelScrollUp".action.focus-column-left = [ ];

      # -- Workspaces --
      "Mod+1".action.focus-workspace = 1;
      "Mod+2".action.focus-workspace = 2;
      "Mod+3".action.focus-workspace = 3;
      "Mod+4".action.focus-workspace = 4;
      "Mod+5".action.focus-workspace = 5;
      "Mod+6".action.focus-workspace = 6;
      "Mod+7".action.focus-workspace = 7;
      "Mod+8".action.focus-workspace = 8;
      "Mod+9".action.focus-workspace = 9;

      "Mod+Shift+1".action.move-column-to-workspace = 1;
      "Mod+Shift+2".action.move-column-to-workspace = 2;
      "Mod+Shift+3".action.move-column-to-workspace = 3;
      "Mod+Shift+4".action.move-column-to-workspace = 4;
      "Mod+Shift+5".action.move-column-to-workspace = 5;
      "Mod+Shift+6".action.move-column-to-workspace = 6;
      "Mod+Shift+7".action.move-column-to-workspace = 7;
      "Mod+Shift+8".action.move-column-to-workspace = 8;
      "Mod+Shift+9".action.move-column-to-workspace = 9;

      # -- Media & System (Standard) --
      "XF86AudioRaiseVolume".action.spawn =
        [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+" ];
      "XF86AudioLowerVolume".action.spawn =
        [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-" ];
      "XF86AudioMute".action.spawn =
        [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];
      "Mod+Shift+M".action.spawn =
        [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];

      # Niri Specific
      "Mod+Shift+E".action = quit;
      "Mod+Shift+S".action.screenshot-screen = [ ]; # Niri native screenshot
      "Print".action.screenshot = [ ];

      # Media keys (playerctl)
      "XF86AudioPlay".action.spawn = "playerctl play-pause";
      "XF86AudioPause".action.spawn = "playerctl play-pause";
      "XF86AudioNext".action.spawn = "playerctl next";
      "XF86AudioPrev".action.spawn = "playerctl previous";
      "XF86AudioStop".action.spawn = "playerctl stop";

      # Brightness keys (brightnessctl)
      "XF86MonBrightnessUp".action.spawn = "brightnessctl set +5%";
      "XF86MonBrightnessDown".action.spawn = "brightnessctl set 5%-";
    };

    # Animations
    animations = { slowdown = 1.0; };

    # Windows rules
    window-rules = [{
      matches = [{ app-id = "^org\\.keepassxc\\.KeePassXC$"; }];
      block-out-from = "screen-capture";
    }];
  };
}
