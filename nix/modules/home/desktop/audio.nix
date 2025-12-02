{ pkgs, ... }:

{
  services.easyeffects.enable = true;

  home.packages = with pkgs; [
    pavucontrol
    pulsemixer
  ];
}
