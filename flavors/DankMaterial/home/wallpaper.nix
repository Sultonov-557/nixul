{
  # Wallpaper configuration using hyprpaper

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [ "../../../wallpaper.png" ];

      wallpaper = [
        "DP-1,../../../wallpaper.png"
        "HDMI-A-1,../../../wallpaper.png"
      ];
    };
  };
}
