{ config, pkgs, ... }:

{
  # Global system configuration - imports all modules

  imports = [
    ./locale.nix
    ./nix.nix
    ./users.nix
    ./networking.nix
    ./packages.nix
  ];

  # System state version
  system.stateVersion = "25.05";
}
