{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ wireshark ];
}
