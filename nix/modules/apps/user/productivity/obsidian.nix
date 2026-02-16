{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ obsidian ];
}
