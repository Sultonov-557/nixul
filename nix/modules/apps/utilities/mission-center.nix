{ pkgs, ... }:
{

  environment.defaultPackages = with pkgs; [ mission-center ];
}
