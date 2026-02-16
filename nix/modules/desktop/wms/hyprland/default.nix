{
  config,
  ...
}:
{
  programs.hyprland = {
    enable = true;
  };

  home-manager.users.${config.nixul.user} = {
    imports = [
      ./keybinds.nix
      ./settings.nix
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;
    };
  };
}
