{ pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      name = "WhiteSur-Light";
      package = pkgs.whitesur-gtk-theme;
    };

    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };

    cursorTheme = {
      name = "macOS-BigSur";
      package = pkgs.apple-cursor;
      size = 24;
    };

    font = {
      name = "Inter";
      size = 11;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = false;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = false;
    };
  };

  home.pointerCursor = {
    name = "macOS-BigSur";
    package = pkgs.apple-cursor;
    size = 24;
    gtk.enable = true;
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita";
  };
}
