{ osConfig, ... }:
let
  cfg = osConfig.nixul.theme;
  palette = cfg.colors.palette;
in
{
  programs.noctalia-shell.settings = {
    wallpaper = {
      enabled = true;
      overviewEnabled = true;
      directory =
        if cfg.wallpaper != null then
          builtins.dirOf cfg.wallpaper
        else
          "${../../../../../assets/public/wallpapers}";
      monitorDirectories = [ ];
      enableMultiMonitorDirectories = false;
      recursiveSearch = false;
      setWallpaperOnAllMonitors = true;
      fillMode = "crop";
      fillColor = "#${palette.base00}";
      useSolidColor = false;
      solidColor = "#${palette.base00}";
      automationEnabled = false;
      wallpaperChangeMode = "random";
      randomIntervalSec = 60 * 60 * 1; # 1 hour
      transitionDuration = 1500;
      transitionType = "random";
      transitionEdgeSmoothness = 0.05;
      panelPosition = "follow_bar";
      hideWallpaperFilenames = false;
      useWallhaven = false;
    };
  };
}
