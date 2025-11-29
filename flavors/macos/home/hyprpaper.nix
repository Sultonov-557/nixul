{ pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ ../assets/wallpaper.jpg ];
      wallpaper = [ ../assets/wallpaper.jpg ];
      splash = false;
    };
  };
}
