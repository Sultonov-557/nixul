{ config, pkgs, ... }:

{
  # Desktop Applications and Utilities

  home.packages = with pkgs; [
    # Screenshot tools
    swappy

    # Color picker
    hyprpicker

    # Clipboard manager
    wl-clipboard
    cliphist

    # Wallpaper
    hyprpaper
  ];
}
