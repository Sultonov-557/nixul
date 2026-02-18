{
  programs.caelestia.settings = {
    background.enabled = false;
    appearance = {
      transparency = {
        enable = true;
        base = 0.85;
        layers = 0.4;
      };
    };
    utilities = {
      enabled = true;
      maxToasts = 4;
      toasts = {
        audioInputChanged = false;
        audioOutputChanged = false;
        capsLockChanged = false;
        chargingChanged = true;
        configLoaded = false;
        dndChanged = true;
        gameModeChanged = true;
        numLockChanged = false;
        nowPlaying = false;
        kbLayoutChanged = false;
      };
    };
    dashboard.showOnHover = false;
    border = {
      thickness = 8;
    };
  };
}
