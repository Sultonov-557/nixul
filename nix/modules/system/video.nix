{ ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;
  programs.xwayland.enable = true;

  environment.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };
}
