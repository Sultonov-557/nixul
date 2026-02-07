{ pkgs, ... }:
{

  environment.defaultPackages = with pkgs; [ tor-browser ];
}
