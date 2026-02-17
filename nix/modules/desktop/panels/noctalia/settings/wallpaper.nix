{
  programs.noctalia-shell.settings = {
    wallpaper = {
      enabled = true;
      overviewEnabled = true;
      directory = "${../../../../../assets/public/wallpapers}";
      monitorDirectories = [ ];
      enableMultiMonitorDirectories = false;
      recursiveSearch = false;
      setWallpaperOnAllMonitors = true;
      fillMode = "crop";
      fillColor = "#000000";
      useSolidColor = false;
      solidColor = "#1a1a2e";
      automationEnabled = true;
      wallpaperChangeMode = "random";
      randomIntervalSec = 300;
      transitionDuration = 1500;
      transitionType = "random";
      transitionEdgeSmoothness = 0.05;
      panelPosition = "follow_bar";
      hideWallpaperFilenames = false;
      useWallhaven = false;
    };
  };
}
