{ inputs, pkgs, config, ... }: {

  imports = [ inputs.stylix.nixosModules.stylix ];

  home-manager.users.${config.nixul.user} = {
    stylix.targets = {
      nixvim = {
        opacity.enable = true;
        transparentBackground = {
          main = true;
          numberLine = true;
          signColumn = true;
        };
      };
    };
  };

  stylix = {
    enable = true;

    base16Scheme = {
      scheme = "nixul";
      author = "https://github.com/Sultonov-557/nixul";

      # === Background shades ===
      base00 = "#1e1e1e"; # Default background
      base01 = "#181818"; # Darker background (panels, sidebars)
      base02 = "#323232"; # Selection background
      base03 = "#454545"; # Comments / subtle UI elements

      # === Foreground shades ===
      base04 = "#585858"; # Dark foreground (secondary text)
      base05 = "#cdcdcd"; # Default foreground (main text)
      base06 = "#f5f5f5"; # Light foreground (high emphasis)
      base07 = "#ffffff"; # Bright foreground (rare highlights)

      # === Accent colors ===
      base08 = "#FF0800"; # Red      (errors, danger)
      base09 = "#FF4F00"; # Orange   (warnings, numbers)
      base0A = "#FDEE00"; # Yellow   (attention, search)
      base0B = "#66FF00"; # Green    (success)
      base0C = "#6CB4EE"; # Blue     (info, hints)
      base0D = "#8B0000"; # Blood red     (primary accent)
      base0E = "#00FF00"; # Black   (secondary accent)
      base0F = "#8A2BE2"; # Purple  (rare / decorative)
    };

    image = ../../../assets/wallpaper.png;

    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    opacity = {
      applications = 0.0;
      terminal = 0.0;
      desktop = 0.0;
      popups = 0.0;
    };

    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      serif = {
        package = pkgs.inter;
        name = "Inter";
      };

      sizes = {
        applications = 11;
        terminal = 12;
        desktop = 10;
        popups = 10;
      };
    };

  };
}
