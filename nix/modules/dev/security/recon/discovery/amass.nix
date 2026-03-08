{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ amass ];
}
