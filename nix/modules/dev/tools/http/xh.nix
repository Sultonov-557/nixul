{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ xh ];
}
