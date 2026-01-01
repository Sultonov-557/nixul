{
  pkgs,
  user,
  config,
  ...
}:

{
  system.nixos.label = "catppuccin";

  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
  };

  modules.system = {
    services = {
      desktop.displayManager.gdm.enable = true;
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

  environment.systemPackages = with pkgs; [
    rofi
    hyprpaper
    nautilus
    brightnessctl
    pamixer
    playerctl
    hyprpicker
  ];

  home-manager.users.${config.nixul.user}.imports = [ ./home.nix ];
}
