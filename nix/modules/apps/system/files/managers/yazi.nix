{ pkgs, ... }:
{

  programs.yazi.enable = true;
  environment.defaultPackages = with pkgs; [ yazi ];
}
