{ pkgs, ... }:

{
  programs.dankMaterialShell.enable = true;

  home.packages = with pkgs; [ swaybg ];

  imports = [ ./home ];
}
