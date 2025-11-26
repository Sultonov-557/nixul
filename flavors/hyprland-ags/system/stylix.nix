{ config, pkgs, ... }:

{
  # Stylix Theme Configuration for Hyprland Flavor

  stylix = {
    enable = true;

    # Catppuccin Mocha theme
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    # Alternative: Use wallpaper-based theming
    # image = /path/to/your/wallpaper.png;

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.roboto;
        name = "Roboto";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 11;
        terminal = 11;
        desktop = 10;
        popups = 10;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    opacity = {
      terminal = 0.9;
      applications = 1.0;
      desktop = 1.0;
      popups = 1.0;
    };

    polarity = "dark";
  };
}
