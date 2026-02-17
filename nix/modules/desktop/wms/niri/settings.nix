{
  programs.niri.settings = {
    animations = {
      slowdown = 1.0;
    };

    window-rules = [
      {
        matches = [ { app-id = "^org\\.keepassxc\\.KeePassXC$"; } ];
        block-out-from = "screen-capture";
      }
      {
        geometry-corner-radius = {
          top-left = 20.0;
          bottom-left = 20.0;
          top-right = 20.0;
          bottom-right = 20.0;
        };
      }
    ];

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

      default-column-width = {
        proportion = 1.0;
      };

      focus-ring = {
        enable = false;
        width = 2;
      };

      shadow = {
        enable = false;
      };

      border = {
        enable = false;
        width = 2;
      };
    };
  };
}