{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ playerctl ];
}
