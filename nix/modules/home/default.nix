{ ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";

  imports = [ ./utils ./terminal ./editor ./desktop ./apps ./ai ];
}
