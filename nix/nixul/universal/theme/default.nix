{
  lib,
  config,
  nix-colors,
  ...
}:
let
  cfg = config.nixul.theme;
in
{
  options.nixul.theme = {
    colors = {
      scheme = lib.mkOption {
        type = lib.types.str;
        default = "gruvbox-material-dark-hard";
        description = "Base16 scheme name or path to yaml";
      };
      # This will be populated by nix-colors
      palette = lib.mkOption {
        type = lib.types.attrsOf lib.types.str;
        default = { };
        description = "Calculated palette (hex colors)";
      };
    };

    cursor = {
      package = lib.mkOption {
        type = lib.types.package;
        description = "Cursor theme package";
      };
      name = lib.mkOption {
        type = lib.types.str;
        description = "Cursor theme name";
      };
      size = lib.mkOption {
        type = lib.types.int;
        default = 24;
        description = "Cursor size";
      };
    };

    icons = {
      package = lib.mkOption {
        type = lib.types.package;
        description = "Icon theme package";
      };
      name = lib.mkOption {
        type = lib.types.str;
        description = "Icon theme name";
      };
    };

    fonts = {
      monospace = lib.mkOption {
        type = lib.types.submodule {
          options = {
            package = lib.mkOption { type = lib.types.package; };
            name = lib.mkOption { type = lib.types.str; };
            size = lib.mkOption {
              type = lib.types.int;
              default = 12;
            };
          };
        };
      };
      sansSerif = lib.mkOption {
        type = lib.types.submodule {
          options = {
            package = lib.mkOption { type = lib.types.package; };
            name = lib.mkOption { type = lib.types.str; };
            size = lib.mkOption {
              type = lib.types.int;
              default = 11;
            };
          };
        };
      };
      serif = lib.mkOption {
        type = lib.types.submodule {
          options = {
            package = lib.mkOption { type = lib.types.package; };
            name = lib.mkOption { type = lib.types.str; };
            size = lib.mkOption {
              type = lib.types.int;
              default = 11;
            };
          };
        };
      };
    };

    opacity = {
      applications = lib.mkOption {
        type = lib.types.float;
        default = 1.0;
      };
      terminal = lib.mkOption {
        type = lib.types.float;
        default = 1.0;
      };
      desktop = lib.mkOption {
        type = lib.types.float;
        default = 1.0;
      };
      popups = lib.mkOption {
        type = lib.types.float;
        default = 1.0;
      };
    };

    wallpaper = lib.mkOption {
      type = lib.types.nullOr lib.types.path;
      default = null;
      description = "Path to wallpaper";
    };
  };

  config = {
    nixul.theme.colors.palette =
      (nix-colors.colorSchemes.${cfg.colors.scheme} or (import cfg.colors.scheme)).palette;
  };
}
