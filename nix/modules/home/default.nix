{ pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.packages = with pkgs; [ home-manager ];
  home.stateVersion = "25.11";

  imports = [ ./utils ./terminal ./editor ./desktop ./apps ./ai ];
}
