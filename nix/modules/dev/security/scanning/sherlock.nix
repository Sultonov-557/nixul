{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ sherlock ];
}
