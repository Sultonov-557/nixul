{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ inetutils ];
}
