{
  meta = {
    scope = "user";
    hm = true;
    system = true;
  };

  system = _: {
    programs.hyprland.enable = true;
    services.displayManager.dms-greeter.compositor.name = "hyprland";
  };

  home = _: {
    imports = [ ./settings.nix ];
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;
      settings = {
        monitor = [ "eDP-1,1920x1080@60,0x0,1" ];
      };
    };
  };
}
