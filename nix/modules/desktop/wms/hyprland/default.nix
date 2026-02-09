{
  pkgs,
  config,
  inputs,
  ...
}:
{
  environment.systemPackages = [ inputs.hyprland.packages.${pkgs.system}.hyprland ];
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
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

      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;

    };
  };
}
