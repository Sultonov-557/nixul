{
  programs.niri.settings = {
    # Window rules
    window-rules = [
      # Float rules for system dialogs
      {
        matches = [
          { app-id = "^pavucontrol$"; }
        ];
        default-column-width = { proportion = 0.3; };
      }
      {
        matches = [
          { app-id = "^nm-connection-editor$"; }
        ];
        default-column-width = { proportion = 0.3; };
      }
      {
        matches = [
          { app-id = "^blueman-manager$"; }
        ];
        default-column-width = { proportion = 0.3; };
      }
      {
        matches = [
          { title = "^Picture-in-Picture$"; }
        ];
        default-column-width = { proportion = 0.2; };
        open-on-output = "eDP-1";
      }

      # Opacity rules for terminals
      {
        matches = [
          { app-id = "^ghostty$"; }
        ];
        opacity = 0.92;
      }
      {
        matches = [
          { app-id = "^kitty$"; }
        ];
        opacity = 0.92;
      }
      {
        matches = [
          { app-id = "^Alacritty$"; }
        ];
        opacity = 0.92;
      }

      # Opacity for code editors
      {
        matches = [
          { app-id = "^code$"; }
          { app-id = "^VSCodium$"; }
        ];
        opacity = 0.95;
      }

      # Dialog windows - make them smaller
      {
        matches = [
          { title = "^Open File$"; }
          { title = "^Save File$"; }
        ];
        default-column-width = { proportion = 0.4; };
      }
    ];

    # Note: Niri doesn't have layer rules like Hyprland
    # Layer shell applications are handled differently
    # Background blur can be configured globally if needed
  };
}
