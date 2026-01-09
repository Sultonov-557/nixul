{ pkgs, user, config, inputs, ... }:

{
  system.nixos.label = "catppuccin";

  #imports = [ inputs.niri.nixosModules.niri ];

  programs.niri = { enable = true; };

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
    niri
    nautilus
    brightnessctl
    pamixer
    playerctl
    hyprpicker
  ];

  home-manager.users.${config.nixul.user}.imports = [ ./home.nix ];
}
