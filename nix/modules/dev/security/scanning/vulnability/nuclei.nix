{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nuclei
  ];
}
