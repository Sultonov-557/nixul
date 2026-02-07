{ ... }:
{
  services.xserver.enable = true;
  programs.xwayland.enable = true;

  environment.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };
}
