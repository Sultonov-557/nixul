{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ wifite2 ];
}
