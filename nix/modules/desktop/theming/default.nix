{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.nixul.theme;
  palette = cfg.colors.palette;
in
{
  home =
    { ... }:
    {
      # GTK styling
      gtk = {
        enable = true;
        iconTheme = {
          package = cfg.icons.package;
          name = cfg.icons.name;
        };
        font = {
          package = cfg.fonts.sansSerif.package;
          name = cfg.fonts.sansSerif.name;
          size = cfg.fonts.sansSerif.size;
        };
        # We could use a specific GTK theme package here if we wanted to enforce it
        # but by default we rely on the OS or manual overrides.
        # Many people prefer adw-gtk3 or similar.
        theme = {
          package = pkgs.adw-gtk3;
          name = "adw-gtk3";
        };
      };

      # Qt styling
      qt = {
        enable = true;
        platformTheme.name = "gtk";
        style.name = "adwaita-dark";
      };

      # Cursor styling
      home.pointerCursor = {
        package = cfg.cursor.package;
        name = cfg.cursor.name;
        size = cfg.cursor.size;
        gtk.enable = true;
        x11.enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = true;
          description = "Enable universal theming";
        };
      };
    };
    default = {
      enable = true;
    };
  };
}
