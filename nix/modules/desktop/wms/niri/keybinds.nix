{ config, ... }:
{
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Return".action.spawn = "ghostty";
    "Mod+E".action.spawn = "nautilus";
    "Mod+W".action.spawn = "zen";
    "Mod+T".action.spawn = "Telegram";
    "Mod+M".action.spawn = "yandex-music";
    "Mod+Shift+C".action.spawn = [
      "hyprpicker"
      "-a"
    ];
    "Mod+Shift+V".action.spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "launcher"
      "clipboard"
    ];

    "Mod+Space".action.spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "launcher"
      "toggle"
    ];
    "Mod+Shift+L".action.spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "lockScreen"
      "lock"
    ];

    "Mod+Q".action = close-window;
    "Mod+F".action = fullscreen-window;
    "Mod+V".action = toggle-window-floating;
    "Mod+Ctrl+C".action = center-column;

    "Mod+Left".action = focus-column-left;
    "Mod+Down".action = focus-window-down;
    "Mod+Up".action = focus-window-up;
    "Mod+Right".action = focus-column-right;

    "Mod+Shift+Left".action = move-column-left;
    "Mod+Shift+Down".action = move-window-down;
    "Mod+Shift+Up".action = move-window-up;
    "Mod+Shift+Right".action = move-column-right;

    "Mod+Home".action.focus-column-first = [ ];
    "Mod+End".action.focus-column-last = [ ];
    "Mod+WheelScrollDown".action.focus-column-right = [ ];
    "Mod+WheelScrollUp".action.focus-column-left = [ ];

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

    "XF86AudioRaiseVolume" = {
      action.spawn = [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "0.1+"
      ];
      allow-when-locked = true;
    };
    "XF86AudioLowerVolume" = {
      action.spawn = [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "0.1-"
      ];
      allow-when-locked = true;
    };
    "XF86AudioMute" = {
      action.spawn = [
        "wpctl"
        "set-mute"
        "@DEFAULT_AUDIO_SINK@"
        "toggle"
      ];
      allow-when-locked = true;
    };
    "Mod+Shift+M".action.spawn = [
      "wpctl"
      "set-mute"
      "@DEFAULT_AUDIO_SINK@"
      "toggle"
    ];

    "Mod+Shift+E".action = quit;
    "Mod+Shift+S".action.screenshot-screen = [ ];
    "Print".action.screenshot = [ ];

    "XF86AudioPlay" = {
      action.spawn = [
        "playerctl"
        "play-pause"
      ];
      allow-when-locked = true;
    };
    "XF86AudioPause" = {
      action.spawn = [
        "playerctl"
        "play-pause"
      ];
      allow-when-locked = true;
    };
    "XF86AudioNext" = {
      action.spawn = [
        "playerctl"
        "next"
      ];
      allow-when-locked = true;
    };
    "XF86AudioPrev" = {
      action.spawn = [
        "playerctl"
        "previous"
      ];
      allow-when-locked = true;
    };
    "XF86AudioStop" = {
      action.spawn = [
        "playerctl"
        "stop"
      ];
      allow-when-locked = true;
    };

    "XF86MonBrightnessUp" = {
      action.spawn = [
        "brightnessctl"
        "set"
        "+5%"
      ];
      allow-when-locked = true;
    };
    "XF86MonBrightnessDown" = {
      action.spawn = [
        "brightnessctl"
        "set"
        "5%-"
      ];
      allow-when-locked = true;
    };
  };
}
