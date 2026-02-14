{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ libreoffice-fresh ];
}
