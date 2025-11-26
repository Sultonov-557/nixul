{ pkgs, ... }:

{
  # Fonts configuration for DankMaterial flavor

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    jetbrains-mono
    nerd-font-patcher
    noto-fonts-color-emoji
  ];
}
