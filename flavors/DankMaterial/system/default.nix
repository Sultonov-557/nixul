{ config, pkgs, ... }:

{
  # System-level configuration for DankMaterial flavor
  # Imports all system modules

  imports = [
    ../../../modules/system/hyprland.nix
    ./stylix.nix
    ./desktop.nix
    ./services.nix
    ./audio.nix
    ./fonts.nix
  ];
}
