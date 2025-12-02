{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1,1920x1080@60,0x0,1"
      "DP-1,1920x1080@60,0x0,1"
      "HDMI-A-1,1280x1024@60,1920x0,1"
    ];

    env = [
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
    ];

    exec-once = [ "hyprpaper" ];

    general = {
      gaps_in = 8;
      gaps_out = 16;
      border_size = 2;
      resize_on_border = true;
      layout = "dwindle";
    };

    decoration = {
      rounding = 12;
      active_opacity = 0.92;
      inactive_opacity = 0.85;

      blur = {
        enabled = true;
        size = 8;
        passes = 3;
        new_optimizations = true;
        vibrancy = 0.2;
        brightness = 1.0;
        contrast = 1.0;
      };

      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
      };
    };

    animations = {
      enabled = true;
      bezier = "smoothOut, 0.36, 0, 0.66, -0.56";

      animation = [
        "windows, 1, 5, smoothOut, slide"
        "windowsOut, 1, 4, smoothOut, slide"
        "border, 1, 10, default"
        "borderangle, 1, 100, default, loop"
        "fade, 1, 4, default"
        "workspaces, 1, 5, smoothOut, slide"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
    };

    input = {
      kb_layout = "us";
      follow_mouse = 1;

      touchpad = {
        natural_scroll = true;
      };

      sensitivity = 0;
    };
  };
}
