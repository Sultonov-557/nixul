{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # Home-Manager configuration for Hyprland-AGS flavor
  # Imports all home modules

  imports = [
    ../../../modules/home/hyprland-keybinds.nix
    ../../../modules/home/ags.nix
    ../../../modules/home/kitty.nix
    ../../../modules/home/firefox.nix
    ./hyprland.nix
    ./apps.nix
  ];
}
