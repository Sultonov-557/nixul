{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    caido
  ];
}
