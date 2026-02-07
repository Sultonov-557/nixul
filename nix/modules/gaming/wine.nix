{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [
    wine
    winetricks
  ];
}
