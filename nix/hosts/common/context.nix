{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  options.nixul = lib.mkOption {
    type = lib.types.attrs;
    default = { };
  };

  config.nixul = {
    primaryUser = "sultonov";

    aliases = import ../../users/sultonov/alias;

    users.sultonov = {
      name = "sultonov";
      email = "sultonovzerifboy@gmail.com";
      shell = "fish";
      keybinds = map (keybind:
        lib.recursiveUpdate
          {
            action = "spawn";
            args = null;
            repeat = false;
            mouse = false;
            raw = {
              hyprland = null;
              niri = null;
            };
          }
          keybind
      ) (import ../../users/sultonov/keybinds);
      bookmarks = import ../../users/sultonov/bookmarks.nix;
    };

    theme = {
      colors = {
        scheme = "gruvbox-material-dark-hard";
        palette = inputs.nix-colors.colorSchemes.gruvbox-material-dark-hard.palette;
      };
      wallpaper = ../../assets/public/wallpapers/gruvbox.png;
      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 24;
      };
      opacity = {
        applications = 0.7;
        terminal = 0.7;
        desktop = 0.7;
        popups = 0.7;
      };
      icons = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
      fonts = {
        size = 12;
        monospace = {
          package = pkgs.jetbrains-mono;
          name = "JetBrains Mono";
          size = 12;
        };
        sansSerif = {
          package = pkgs.inter;
          name = "Inter";
        };
        serif = {
          package = pkgs.inter;
          name = "Inter";
        };
      };
    };
  };
}
