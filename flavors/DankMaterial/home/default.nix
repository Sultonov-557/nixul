{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # Home-Manager configuration for DankMaterial flavor
  # Imports all home modules

  imports = [
    # Reusable modules
    ../../../modules/home/hyprland-keybinds.nix
    ../../../modules/home/kitty.nix
    ../../../modules/home/firefox.nix

    # Flavor-specific configs
    ./hyprland.nix
    ./wallpaper.nix
    ./apps.nix
  ];
}
