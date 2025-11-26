{ config, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    xfce.thunar

    rofi-wayland

    brightnessctl

    imv

    zathura
  ];

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
