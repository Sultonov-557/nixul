{ pkgs, ... }:

{
  # Global home packages and services

  home.packages = with pkgs; [
    # Applications
    gnome-boxes
    gemini-cli
    antigravity
    cursor-cli
    bruno
    blueman
    pavucontrol
    hyprnome
    yandex-music
    qbittorrent-enhanced
    baobab
    telegram-desktop
    podman-desktop
    dbeaver-bin
    ghostty
    kdePackages.dolphin
    gnome-disk-utility
    gnome-system-monitor
    p7zip
    lxqt.lxqt-policykit
  ];

  services = {
    # Clipboard manager
    cliphist = {
      enable = true;
      allowImages = true;
    };

    # KDE Connect for phone integration
    kdeconnect = {
      enable = true;
      indicator = true;
    };

    # Auto-mount USB drives
    udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "auto";
    };

    # Text expansion
    espanso = {
      enable = true;
      matches = {
        base = {
          matches = [
            {
              trigger = ":email";
              replace = "sultonovzerifboy@gmail.com";
            }
            {
              trigger = ":gh";
              replace = "Sultonov-557";
            }
            {
              trigger = ":date";
              replace = "{{mydate}}";
              vars = [
                {
                  name = "mydate";
                  type = "date";
                  params = {
                    format = "%Y-%m-%d";
                  };
                }
              ];
            }
            {
              trigger = ":time";
              replace = "{{mytime}}";
              vars = [
                {
                  name = "mytime";
                  type = "date";
                  params = {
                    format = "%H:%M:%S";
                  };
                }
              ];
            }
          ];
        };
      };
    };
  };
}
