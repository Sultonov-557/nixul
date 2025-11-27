{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 5;
      border_size = 1;
      resize_on_border = true;
      allow_tearing = false;
      layout = "scrolling";
    };

    decoration = {
      rounding = 0;
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
      };
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        vibrancy = 0.1696;
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

    input = {
      kb_layout = "us";
      follow_mouse = 1;
      sensitivity = 0.5;
      accel_profile = "flat";

      touchpad = {
        natural_scroll = true;
        disable_while_typing = true;
        tap-to-click = true;
      };
    };

    cursor = {
      inactive_timeout = 0;
      default_monitor = "";
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      new_status = "master";
    };

    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
    };

    xwayland = {
      force_zero_scaling = true;
    };

    env = [
      "DISPLAY,:0"
      "GDK_SCALE,1"
      "GDK_DPI_SCALE,1"
      "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      "QT_SCALE_FACTOR,1"
    ];

    exec-once = [
      "nvidia-settings -a '[gpu:0]/DigitalVibrance=75'"
      "nvidia-settings -a '[dpy:HDMI-0]/DigitalVibrance=75'"
    ];
  };
}
