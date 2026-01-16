{ inputs, ... }: {
  imports = [ inputs.dms.homeModules.dank-material-shell ];

  programs.dank-material-shell = {
    systemd = {
      enable = true; # Systemd service for auto-start
      restartIfChanged =
        true; # Auto-restart dms.service when dankMaterialShell changes
    };

    # Core features
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableVPN = true; # VPN management widget
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = true; # Calendar integration (khal)
  };
}
