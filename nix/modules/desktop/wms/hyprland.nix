{ config, pkgs, ... }:
let mod = "SUPER";
in {

  environment.defaultPackages = with pkgs; [ hyprland ];
  programs.hyprland.enable = true;
  home-manager.users.${config.nixul.user} = {
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;

      settings = {
        exec-once = [
          "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          # "hyprpaper" # Wallpaper utility, if used
          # "waybar" # Status bar, if used
          # "swayidle -w before-sleep 'gtklock'"" # Lock screen, if used
        ];

        # Set default programs
        env = [
          "TERM,alacritty"
          "BROWSER,firefox" # Default browser, can be zen
        ];

        # Input settings
        input = {
          kb_layout = "us";
          kb_options = "grp:win_space_toggle,compose:ralt,ctrl:nocaps";

          follow_mouse = 1;

          touchpad = {
            natural_scroll = true;
            tap-to-click = true;
          };
        };

        # General settings
        general = {
          gaps_in = 10;
          gaps_out = 10;
          border_size = 0; # Niri had border disabled
          layout = "master"; # Using master layout for column-like behavior
        };

        # Decoration settings
        decoration = { rounding = 20; };

        # Animations
        animations = {
          enabled = true;
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          animation = "windows, 1, 7, myBezier";
          #animation = "windowsOut, 1, 7, default, popin 80%";
          #animation = "border, 1, 10, default";
          #animation = "borderangle, 1, 8, default";
          #animation = "fade, 1, 7, default";
          #animation = "workspaces, 1, 6, default";
        };

        # Master layout specifics
        master = {
          #new_is_master = true;
          new_on_top = true;
          mfact = 0.55; # Adjust as needed
        };

        # Keybindings
        bind = [
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          "${mod} SHIFT, M, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

          # Media keys (playerctl)
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPause, exec, playerctl play-pause" # Often same as Play
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPrev, exec, playerctl previous"
          ", XF86AudioStop, exec, playerctl stop"

          # Niri Specific ported
          "${mod} SHIFT, E, exit," # Exits Hyprland
          ''
            ${mod} SHIFT, S, exec, grim -g "$(slurp)" - | wl-copy'' # Region screenshot
          ", PRINT, exec, grim - | wl-copy" # Full screenshot
          # -- Applications --
          "${mod}, RETURN, exec, ghostty"
          "${mod}, E, exec, nautilus"
          "${mod}, W, exec, zen"
          "${mod}, T, exec, Telegram"
          "${mod}, M, exec, yandex-music"
          "${mod} SHIFT, C, exec, hyprpicker -a"
          "${mod} SHIFT, V, exec, noctalia-shell ipc call launcher clipboard"
          "${mod}, SPACE, exec, noctalia-shell ipc call launcher toggle"
          "${mod} SHIFT, L, exec, noctalia-shell ipc call lockScreen lock"

          # -- Window Management --
          "${mod}, Q, killactive,"
          "${mod}, F, fullscreen," # Toggles fullscreen on the active window
          "${mod}, V, togglefloating," # Toggles floating mode for the active window

          # -- Focus --
          "${mod}, LEFT, movefocus, l"
          "${mod}, DOWN, movefocus, d"
          "${mod}, UP, movefocus, u"
          "${mod}, RIGHT, movefocus, r"
          # Niri's focus-column-first/last has no direct simple equivalent in Hyprland's master layout

          # -- Move --
          "${mod} SHIFT, LEFT, movewindow, l"
          "${mod} SHIFT, DOWN, movewindow, d"
          "${mod} SHIFT, UP, movewindow, u"
          "${mod} SHIFT, RIGHT, movewindow, r"

          # -- Workspaces --
          "${mod}, 1, workspace, 1"
          "${mod}, 2, workspace, 2"
          "${mod}, 3, workspace, 3"
          "${mod}, 4, workspace, 4"
          "${mod}, 5, workspace, 5"
          "${mod}, 6, workspace, 6"
          "${mod}, 7, workspace, 7"
          "${mod}, 8, workspace, 8"
          "${mod}, 9, workspace, 9"

          "${mod} SHIFT, 1, movetoworkspace, 1"
          "${mod} SHIFT, 2, movetoworkspace, 2"
          "${mod} SHIFT, 3, movetoworkspace, 3"
          "${mod} SHIFT, 4, movetoworkspace, 4"
          "${mod} SHIFT, 5, movetoworkspace, 5"
          "${mod} SHIFT, 6, movetoworkspace, 6"
          "${mod} SHIFT, 7, movetoworkspace, 7"
          "${mod} SHIFT, 8, movetoworkspace, 8"
          "${mod} SHIFT, 9, movetoworkspace, 9"
        ];

        # Keybindings with repeated execution (binde)
        binde = [
          # -- Media & System (Standard) --
          ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-"

          # Brightness keys (brightnessctl)
          ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
          ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ];
      };
    };
  };
}
