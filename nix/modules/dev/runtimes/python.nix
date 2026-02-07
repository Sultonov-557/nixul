{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ python3 ];
}
