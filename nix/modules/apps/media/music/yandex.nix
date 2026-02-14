{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ yandex-music ];
}
