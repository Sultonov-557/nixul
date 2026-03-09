{ osConfig, ... }:
let
  palette = osConfig.nixul.theme.colors.palette;
in
{
  wayland.windowManager.hyprland.settings = {
    general = {
      "col.active_border" = "0xff${palette.base0B}";
      "col.inactive_border" = "0xff${palette.base02}";

      gaps_in = 10;
      gaps_out = 10;
      border_size = 2; # Set border size to see it
      layout = "master";
    };

    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
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
  };
}
