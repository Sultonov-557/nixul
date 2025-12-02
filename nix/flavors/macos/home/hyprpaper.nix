{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "${../assets/wallpaper-light.jpg}" ];
      wallpaper = [ ",${../assets/wallpaper-light.jpg}" ];
      splash = false;
    };
  };
}
