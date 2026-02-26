{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ subfinder ];
}
