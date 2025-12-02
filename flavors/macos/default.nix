{ ... }:

{
  name = "macos";
  description = "macOS-inspired Hyprland Desktop";

  specialisation =
    { pkgs, ... }:
    {
      programs.hyprland = {
        enable = true;
        xwayland.enable = true;
      };

      services.displayManager.sddm = {
        enable = true;
        theme = "macos";
        wayland.enable = true;
      };

      environment.systemPackages = with pkgs; [
        (callPackage ./system/sddm-theme.nix { })
        whitesur-gtk-theme
        whitesur-icon-theme
        apple-cursor
        inter
        jetbrains-mono

        rofi
        hyprpaper
        nautilus
        brightnessctl
        pamixer
        playerctl
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
