{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ simplehttp2server ];
}
