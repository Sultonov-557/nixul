{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ pavucontrol ];
}
