{ pkgs, ... }:

{
  programs.dankMaterialShell.enable = true;
  #programs.noctalia-shell.enable = true;

  home.packages = with pkgs; [ swaybg ];

  imports = [ ./home ];
}
