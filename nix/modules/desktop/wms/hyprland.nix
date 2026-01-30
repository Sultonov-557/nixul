{ config, ... }: {

  home-manager.users.${config.nixul.user} = { ... }: {
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;
    };
  };
}
