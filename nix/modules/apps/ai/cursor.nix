{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ cursor-cli ];
}
