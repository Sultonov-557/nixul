{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    proton-ge-bin
    protontricks
  ];
}
