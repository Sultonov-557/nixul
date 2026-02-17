{
  programs.noctalia-shell.settings = {
    bar = {
      position = "top";
      monitors = [ ];
      density = "default";
      showOutline = false;
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
          {
            icon = "rocket";
            id = "Launcher";
            usePrimaryColor = true;
          }
          {
            characterCount = 1;
            colorizeIcons = true;
            enableScrollWheel = true;
            followFocusedScreen = true;
            groupedBorderOpacity = 0;
            hideUnoccupied = false;
            iconScale = 0.8;
            id = "Workspace";
            labelMode = "index";
            showApplications = false;
            showLabelsOnlyWhenOccupied = false;
            unfocusedIconsOpacity = 1;
          }
          {
            compactMode = false;
            diskPath = "/";
            id = "SystemMonitor";
            showCpuTemp = false;
            showCpuUsage = true;
            showDiskUsage = false;
            showGpuTemp = false;
            showLoadAverage = false;
            showMemoryAsPercent = false;
            showMemoryUsage = true;
            showNetworkStats = false;
            showSwapUsage = true;
            useMonospaceFont = true;
            usePrimaryColor = true;
          }
        ];
        center = [
          {
            compactMode = true;
            compactShowAlbumArt = true;
            compactShowVisualizer = false;
            hideMode = "hidden";
            hideWhenIdle = false;
            id = "MediaMini";
            maxWidth = 145;
            panelShowAlbumArt = true;
            panelShowVisualizer = true;
            scrollingMode = "hover";
            showAlbumArt = true;
            showArtistFirst = true;
            showProgressRing = true;
            showVisualizer = false;
            useFixedWidth = false;
            visualizerType = "wave";
          }
          {
            customFont = "";
            formatHorizontal = "HH:mm ddd, MMM dd";
            formatVertical = "HH mm - dd MM";
            id = "Clock";
            tooltipFormat = "HH:mm ddd, MMM dd";
            useCustomFont = false;
            usePrimaryColor = true;
          }
          {
            defaultSettings = {
              showConditionIcon = true;
              showTempUnit = true;
              showTempValue = true;
              tooltipOption = "everything";
            };
            id = "plugin:weather-indicator";
          }
        ];
        right = [
          {
            blacklist = [ ];
            colorizeIcons = true;
            drawerEnabled = true;
            hidePassive = false;
            id = "Tray";
            pinned = [ ];
          }
          {
            defaultSettings = {
              autoStartBreaks = false;
              autoStartWork = false;
              longBreakDuration = 15;
              sessionsBeforeLongBreak = 4;
              shortBreakDuration = 5;
              workDuration = 25;
            };
            id = "plugin:pomodoro";
          }
          {
            hideWhenZero = false;
            hideWhenZeroUnread = false;
            id = "NotificationHistory";
            showUnreadBadge = true;
          }
          {
            displayMode = "onhover";
            hideIfIdle = false;
            hideIfNotDetected = true;
            id = "Battery";
            showNoctaliaPerformance = false;
            showPowerProfiles = true;
            warningThreshold = 30;
          }
          {
            displayMode = "onhover";
            id = "Volume";
            middleClickCommand = "pwvucontrol || pavucontrol";
          }
          {
            displayMode = "onhover";
            id = "Brightness";
          }
          {
            displayMode = "onhover";
            id = "Bluetooth";
          }
          {
            displayMode = "onhover";
            id = "Network";
          }
          {
            colorizeDistroLogo = false;
            colorizeSystemIcon = "primary";
            customIconPath = "";
            enableColorization = true;
            icon = "noctalia";
            id = "ControlCenter";
            useDistroLogo = true;
          }
        ];
      };
      screenOverrides = [ ];
    };
  };
}
