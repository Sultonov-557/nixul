{ pkgs, ... }:

{

  # Basic configuration can go here
  programs.home-manager.enable = true;

  # Global Home Manager Configuration
  home.stateVersion = "25.11";

  imports = [ ../../modules/home ./xdg.nix ];
}
