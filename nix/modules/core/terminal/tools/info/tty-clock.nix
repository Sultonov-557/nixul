{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tty-clock
  ];
}
