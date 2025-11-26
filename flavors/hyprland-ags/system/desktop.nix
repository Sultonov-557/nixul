{ config, pkgs, ... }:

{
  # Desktop Environment Configuration
  # Display manager, system packages, and services

  # Display manager (greetd with tuigreet)
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  # Desktop environment packages
  environment.systemPackages = with pkgs; [
    # File manager
    xfce.thunar

    # Application launcher
    rofi-wayland

    # Brightness control
    brightnessctl

    # Image viewer
    imv

    # PDF viewer
    zathura
  ];

  # Bluetooth support
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
