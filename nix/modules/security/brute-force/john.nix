{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ john ];
}
