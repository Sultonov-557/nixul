{ ... }:

{
  name = "evergreen";
  description = "Niri with evergreen theme and caelestia-shell";

  specialisation =
    { pkgs, ... }:
    {
      system.nixos.label = "evergreen";

      services.xserver.displayManager.gdm = {
        enable = false;
      };

      environment.systemPackages = with pkgs; [
        rofi
        hyprpaper
        nautilus
        brightnessctl
        pamixer
        playerctl
        hyprpicker
      ];

      imports = [
        ../../modules/system/services/docker.nix
        ../../modules/system/services/postgresql.nix
        ../../modules/system/services/redis.nix
        ../../modules/system/hardware/power.nix
        ../../modules/system/hardware/usb-automount.nix
      ];

      home-manager.users.sultonov.imports = [ ./home ];
    };
}
