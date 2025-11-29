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
        (callPackage ./sddm-theme.nix { })
        whitesur-gtk-theme
        whitesur-icon-theme
        apple-cursor
        inter
        jetbrains-mono

        waybar
        rofi-wayland
        hyprpaper
        nautilus
        brightnessctl
        pamixer
        playerctl
      ];

      home-manager.users.sultonov.imports = [
        ./home
      ];
    };
}
