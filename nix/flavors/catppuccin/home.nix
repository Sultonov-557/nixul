{ ... }:

{
  programs.niri.enable = true;
  programs.dankMaterialShell.enable = true;

  imports = [ ./home ];
}
