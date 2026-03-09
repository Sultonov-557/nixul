{ osConfig, ... }:
{
  programs.noctalia-shell.settings = {
    ui = {
      fontDefault = osConfig.nixul.theme.fonts.sansSerif.name;
      fontFixed = osConfig.nixul.theme.fonts.monospace.name;
      fontDefaultScale = 1;
      fontFixedScale = 1;
      tooltipsEnabled = true;
      panelsAttachedToBar = true;
      settingsPanelMode = "attached";
      wifiDetailsViewMode = "grid";
      bluetoothDetailsViewMode = "grid";
      networkPanelView = "wifi";
      bluetoothHideUnnamedDevices = false;
      boxBorderEnabled = false;
    };
  };
}
