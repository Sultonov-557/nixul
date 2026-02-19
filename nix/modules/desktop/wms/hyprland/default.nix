{
  config,
  ...
}:
{
  programs.hyprland = {
    enable = true;
  };

  services.displayManager.dms-greeter.compositor.name = "hyprland";

  home-manager.users.${config.nixul.primaryUser} = {
    wayland.windowManager.hyprland.settings.monitor = [ "eDP-1,1920x1080@60,0x0,1" ];
    imports = [
      ./settings.nix
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;
    };
  };
}
