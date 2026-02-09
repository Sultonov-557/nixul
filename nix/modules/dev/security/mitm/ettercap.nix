{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [
    ettercap
    ethtool
  ];
}
