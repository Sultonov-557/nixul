{ pkgs, config, ... }:

{
  system.nixos.label = "catppuccin";

  programs.niri.enable = true;
  programs.dank-material-shell.greeter = {
    enable = true;
    compositor.name = "niri";
  };

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
