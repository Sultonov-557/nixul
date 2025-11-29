{ ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 8;

        modules-left = [
          "hyprland/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "tray"
          "pulseaudio"
          "network"
          "battery"
          "custom/user"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "●";
            "2" = "●";
            "3" = "●";
            "4" = "●";
            "5" = "●";
            "6" = "●";
            "7" = "●";
            "8" = "●";
            "9" = "●";
            "10" = "●";
            active = "●";
            default = "○";
          };
          persistent-workspaces = {
            "*" = 5;
          };
        };

        clock = {
          format = "{:%a %b %d  %I:%M %p}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        tray = {
          spacing = 10;
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 {volume}%";
          format-icons = {
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pamixer -t";
          scroll-step = 5;
        };

        network = {
          format-wifi = "  {essid}";
          format-ethernet = "  Connected";
          format-disconnected = "󰤮  Disconnected";
          tooltip-format = "{ifname}: {ipaddr}";
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰂄 {capacity}%";
          format-icons = [
            "󰂃"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };

        "custom/user" = {
          format = " {}";
          exec = "whoami";
          interval = 3600;
        };
      };
    };
  };
}
