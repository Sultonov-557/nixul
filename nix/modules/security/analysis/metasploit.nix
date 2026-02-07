{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ metasploit ];
}
