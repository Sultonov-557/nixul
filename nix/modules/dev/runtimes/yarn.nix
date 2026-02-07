{ pkgs, ... }:
{

  environment.defaultPackages = with pkgs; [ yarn ];
}
