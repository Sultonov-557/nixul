{ pkgs, ... }:

{
  # Firefox Browser Configuration

  programs.firefox = {
    enable = true;

    profiles.nixuser = {
      isDefault = true;

      settings = {
        # Privacy
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;

        # Performance
        "gfx.webrender.all" = true;
        "media.ffmpeg.vaapi.enabled" = true;

        # UI
        "browser.tabs.drawInTitlebar" = true;
        "browser.uidensity" = 0;
      };
    };
  };

  # Additional browser-related packages
  home.packages = with pkgs; [
    # Chromium as alternative browser
    chromium
  ];
}
