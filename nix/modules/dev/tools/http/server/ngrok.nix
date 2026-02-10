{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ ngrok ];
}
