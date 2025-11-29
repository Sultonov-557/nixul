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

      environment.systemPackages = with pkgs; [
        waybar
        rofi
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
