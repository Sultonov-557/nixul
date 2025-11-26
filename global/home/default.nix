{ config, pkgs, ... }:

{
  # Global home configuration - imports all modules

  imports = [
    ./shell.nix
    ./git.nix
    ./packages.nix
  ];

  # Home state version
  home.stateVersion = "25.05";
}
