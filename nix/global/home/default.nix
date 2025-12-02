{ ... }:

{

  # Basic configuration can go here
  programs.home-manager.enable = true;

  # Global Home Manager Configuration
  home.stateVersion = "25.05";

  imports = [
    ./xdg.nix
  ];
}
