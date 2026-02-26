{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [
    hashcat
    hashcat-utils
    clinfo
  ];
}
