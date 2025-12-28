{ ... }:

{
  name = "catppuccin";
  description = "Hyprland with Catppuccin theme and caelestia-shell";

  specialisation = { pkgs, user, ... }: {
    system.nixos.label = "catppuccin";

    programs.hyprland = {
      enable = true;
      package = pkgs.hyprland;
      xwayland.enable = true;
    };

    modules.system.services.desktop.displayManager.gdm.enable = true;

    environment.systemPackages = with pkgs; [
      rofi
      hyprpaper
      nautilus
      brightnessctl
      pamixer
      playerctl
      hyprpicker
    ];

    modules.system = {
      services = {
        virtualisation.docker.enable = true;
        databases = {
          postgresql.enable = true;
          redis.enable = true;
        };
        security.sops.enable = true;
      };
      hardware = {
        management.power.enable = true;
        storage.usb-automount.enable = true;
      };
    };

    home-manager.users.${user}.imports = [ ./home ];
  };
}
