{ pkgs, ... }:

{
  # XDG Portal Configuration

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    config.common.default = "gtk";
  };

  # Set Neovim as the default for plain text
  xdg.mime.defaultApplications."text/plain" = "nvim.desktop";
}
