{
  programs.noctalia-shell.settings = {
    bar = {
      position = "top";
      showCapsule = true;
      useSeparateOpacity = true;
      floating = true;
      marginVertical = 4;
      marginHorizontal = 4;
      outerCorners = true;
      exclusive = true;
      hideOnOverview = false;
      widgets = {
        left = [
          { id = "Launcher"; }
          { id = "Clock"; }
          { id = "SystemMonitor"; }
          { id = "ActiveWindow"; }
          { id = "MediaMini"; }
        ];
        center = [ { id = "Workspace"; } ];
        right = [
          { id = "Tray"; }
          { id = "NotificationHistory"; }
          { id = "Battery"; }
          { id = "Volume"; }
          { id = "Brightness"; }
          { id = "ControlCenter"; }
        ];
      };
    };
  };
}
