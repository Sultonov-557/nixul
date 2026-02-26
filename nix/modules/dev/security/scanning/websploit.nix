{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ websploit ];
}
