{ ... }:

{
  imports = [
    ../../../modules/home/nixvim
    ../../../modules/home/ghostty.nix
    ../../../modules/home/hyprland.nix

    ../../../modules/home/shell.nix
    ../../../modules/home/git.nix
    ../../../modules/home/screenshots.nix
    ../../../modules/home/notifications.nix

    ./ghostty.nix
    ./gtk.nix
    ./rofi.nix
    ./hyprpaper.nix
    ./waybar/config.nix

    ./hyprland/settings.nix
    ./hyprland/keybinds.nix
    ./hyprland/rules.nix
  ];

  home.stateVersion = "24.05";
}
