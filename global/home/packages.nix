{ config, pkgs, ... }:

{
  # Global User Packages
  # Essential CLI tools available for all users

  home.packages = with pkgs; [
    vim
    tmux
    htop
    tree
    unzip
  ];
}
