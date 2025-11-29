{ pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/sultonov/nixos2/flavors/macos/assets/wallpaper.jpg" ];
      wallpaper = [ ",/home/sultonov/nixos2/flavors/macos/assets/wallpaper.jpg" ];
      splash = false;
    };
  };
}
