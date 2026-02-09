{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [
    nautilus
    gvfs
  ];
}
