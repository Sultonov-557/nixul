{ config, pkgs, ... }:

{
  # Global home configuration - imports all modules

  imports = [
    ./shell.nix
    ./git.nix
    ./packages.nix
  ];

  # Session variables
  home.sessionVariables = {
    # Specific to NixOS, forces Electron apps to use Wayland
    NIXOS_OZONE_WL = "1";
  };

  # XDG MIME apps
  xdg.mimeApps = {
    enable = true;
  };

  # Home state version
  home.stateVersion = "25.05";
}
