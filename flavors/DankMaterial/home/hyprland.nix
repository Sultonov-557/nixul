{
  pkgs,
  inputs,
  lib,
  ...
}:

{
  # Hyprland configuration for DankMaterial flavor

  # Import hyprland configuration modules
  imports = [
    ./hyprland-config/keybindings.nix
    ./hyprland-config/monitors.nix
    ./hyprland-config/settings.nix
    ./hyprland-config/plugins.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;

    plugins = [
      pkgs.hyprlandPlugins.hyprexpo
      pkgs.hyprlandPlugins.hyprscrolling
    ];
  };

  # Hyprland-related packages
  home.packages = with pkgs; [
    wlsunset
    brightnessctl
    pamixer

    wl-clipboard
    cliphist

    grim
    slurp
    swappy
    libnotify
  ];
}
