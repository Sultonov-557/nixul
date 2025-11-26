{ config, pkgs, ... }:

{
  # System-level configuration for Hyprland-AGS flavor
  # Imports all system modules

  imports = [
    ../../../modules/system/hyprland.nix
    ../../../modules/system/audio.nix
    ../../../modules/system/fonts.nix
    ./stylix.nix
    ./desktop.nix
  ];
}
