{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [
    nmap
    zenmap
  ];
}
