{ ... }:

{
  name = "catppuccin";
  description = "Hyprland with Catppuccin theme and caelestia-shell";

  specialisation =
    { pkgs, ... }:
    {
      programs.hyprland = {
        enable = true;
        xwayland.enable = true;
      };

      services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
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
