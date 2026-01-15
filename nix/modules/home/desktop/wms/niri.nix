{ inputs, ... }: {
  imports = [ inputs.niri.homeModules.niri ];

  programs.niri = {
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
  };
}
