{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ baobab ];
}
