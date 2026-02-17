{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [
    lutgen
    lutgen-studio
  ];
}
