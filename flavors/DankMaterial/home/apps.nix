{ pkgs, ... }:

{
  # DankMaterialShell configuration and apps

  programs.dankMaterialShell = {
    enable = true;
    enableSystemd = true;
    enableSystemMonitoring = true;
    enableClipboard = true;
    enableVPN = true;
    enableBrightnessControl = true;
    enableColorPicker = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableSystemSound = true;
  };

  # Nixcord (Discord) configuration
  programs.nixcord = {
    enable = true;
    discord.enable = false;
    vesktop.enable = true;
    config = {
      plugins = {
        alwaysAnimate.enable = true;
        anonymiseFileNames.enable = true;
        silentTyping.enable = true;
        typingIndicator.enable = true;
        typingTweaks.enable = true;
        whoReacted.enable = true;
        betterFolders.enable = true;
        betterSettings.enable = true;
        messageClickActions.enable = true;
        ignoreActivities = {
          enable = true;
          ignorePlaying = true;
          ignoreWatching = true;
        };
      };
    };
  };
}
