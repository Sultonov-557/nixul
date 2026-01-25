{ ... }: {
  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;
  programs.xwayland.enable = true;
}
