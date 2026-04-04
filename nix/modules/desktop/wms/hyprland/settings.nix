{ osConfig, ... }:
{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 10;
      gaps_out = 10;
      border_size = 2; # Set border size to see it
      layout = "master";
    };

    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "hyprctl setcursor ${osConfig.nixul.theme.cursor.name} ${toString osConfig.nixul.theme.cursor.size}"
    ];

    input = {
      kb_layout = "us";
      kb_options = "grp:win_space_toggle,compose:ralt,ctrl:nocaps";

      follow_mouse = 1;

      touchpad = {
        natural_scroll = true;
        tap-to-click = true;
      };
    };

    decoration = {
      rounding = 20;
      blur = {
        passes = 2;
      };
    };

    animations = {
      enabled = true;
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };

    master = {
      new_on_top = true;
      mfact = 0.55;
    };

    cursor = {
      no_hardware_cursors = true;
    };

    env = [
      "XCURSOR_THEME,${osConfig.nixul.theme.cursor.name}"
      "XCURSOR_SIZE,${toString osConfig.nixul.theme.cursor.size}"
    ];

    windowrule = [
      # Firefox Picture-in-Picture
      "float on, match:class ^Firefox$"
      "pin on, match:class ^Firefox$"
      "size 480 270, match:class ^Firefox$"
      "center on, match:class ^Firefox$"

      # Chrome/Chromium Picture-in-Picture
      "float on, match:class ^chrome$"
      "pin on, match:class ^chrome$"
      "size 480 270, match:class ^chrome$"
      "center on, match:class ^chrome$"

      # Zen Browser Picture-in-Picture
      "float on, match:class ^zen$"
      "pin on, match:class ^zen$"
      "size 480 270, match:class ^zen$"
      "center on, match:class ^zen$"

      # General Picture-in-Picture windows
      "float on, match:title Picture-in-Picture"
      "pin on, match:title Picture-in-Picture"
    ];
  };
}
