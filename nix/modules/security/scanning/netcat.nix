{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ netcat ];
}
