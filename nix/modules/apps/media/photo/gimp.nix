{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ gimp ];
}
