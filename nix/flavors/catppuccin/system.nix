{ pkgs, config, ... }:

{
  system.nixos.label = "catppuccin";

  programs.niri.enable = true;
  services.displayManager.gdm.enable = true;

  environment.systemPackages = with pkgs; [
    niri
    nautilus
    brightnessctl
    pamixer
    playerctl
    hyprpicker
  ];

  home-manager.users.${config.nixul.user}.imports = [ ./home.nix ];
}
