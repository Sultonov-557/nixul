{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ via ];
}
