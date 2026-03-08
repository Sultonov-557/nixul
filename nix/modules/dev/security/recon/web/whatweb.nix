{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ whatweb ];
}
