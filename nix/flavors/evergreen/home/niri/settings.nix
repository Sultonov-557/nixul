{
  programs.niri.settings = {
    # Output (monitor) configuration
    outputs = {
      "eDP-1" = {
        mode = {
          width = 1920;
          height = 1080;
          refresh = 60.0;
        };
        scale = 1.0;
        position = {
          x = 0;
          y = 0;
        };
      };
      "DP-1" = {
        mode = {
          width = 1920;
          height = 1080;
          refresh = 60.0;
        };
        scale = 1.0;
        position = {
          x = 0;
          y = 0;
        };
      };
      "HDMI-A-1" = {
        mode = {
          width = 1280;
          height = 1024;
          refresh = 60.0;
        };
        scale = 1.0;
        position = {
          x = 1920;
          y = 0;
        };
      };
    };

    # Environment variables
    environment = {
      XCURSOR_SIZE = "24";
    };

    # Input configuration
    input = {
      keyboard = {
        xkb = {
          layout = "us";
        };
      };

      touchpad = {
        natural-scroll = true;
        tap = true;
      };

      mouse = {
        accel-speed = 0.0;
      };

      focus-follows-mouse = true;
    };

    # Layout configuration
    layout = {
      gaps = 8;
      center-focused-column = "never";

      preset-column-widths = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
      ];

      default-column-width = {
        proportion = 0.5;
      };

      border = {
        enable = true;
        width = 2;
        active.color = "#7aa2f7";
        inactive.color = "#414868";
      };

      focus-ring = {
        enable = false;
      };

      struts = {
        left = 0;
        right = 0;
        top = 0;
        bottom = 0;
      };
    };

    # Prefer no gaps when there's only a single window
    prefer-no-csd = false;

    # Spawn applications at the end
    spawn-at-startup = [
      # Add your startup applications here
    ];

    # Window decoration and visual settings
    # Note: Niri doesn't have the same granular animation/decoration controls as Hyprland
    # Blur and advanced effects are compositor-level and less configurable

    cursor = {
      size = 24;
    };

    # Animations
    animations = {
      slowdown = 1.0;

      window-open = {
        duration-ms = 200;
        curve = "ease-out-quad";
      };

      window-close = {
        duration-ms = 150;
        curve = "ease-out-quad";
      };

      window-movement = {
        duration-ms = 200;
        curve = "ease-out-cubic";
      };

      workspace-switch = {
        duration-ms = 250;
        curve = "ease-out-cubic";
      };

      horizontal-view-movement = {
        duration-ms = 250;
        curve = "ease-out-cubic";
      };

      window-resize = {
        duration-ms = 200;
        curve = "ease-out-quad";
      };

      config-notification-open-close = {
        duration-ms = 150;
        curve = "ease-out-quad";
      };
    };

    # Screenshot path
    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

    # Hotkey overlay
    hotkey-overlay = {
      skip-at-startup = false;
    };
  };
}
