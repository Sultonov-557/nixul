{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ usql ];

}
