{ pkgs, ... }:

let
  base16Scheme = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/base16-project/base16-schemes/main/catppuccin-mocha.yaml";
    sha256 = "sha256:0ncxr9rl3mv0shwsz6jb5nrfhxlwnyps3izyjixjmvi5x4mwg238";
  };
in
{

  environment.variables = {
    XCURSOR_THEME = "catppuccin-mocha-dark-cursors";
    XCURSOR_SIZE = "24";
  };

  stylix = {
    enable = true;
    polarity = "dark";
    autoEnable = true;

    base16Scheme = "${base16Scheme}";

    image = ../assets/wallpaper.png

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
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    opacity = {
      applications = 0.8;
      desktop = 0.8;
      terminal = 0.8;
      popups = 1.0;
    };
  };
}
