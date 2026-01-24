{ config, ... }: {
  programs.niri = {
    enable = true;
    settings = {
      spawn-at-startup =
        [{ argv = [ "swaybg" "--image" "${../assets/wallpaper.png}" ]; }];

      binds = with config.lib.niri.actions; {
        # -- Applications --
        "Mod+Return".action.spawn = "ghostty";
        "Mod+E".action.spawn = "nautilus"; # File Manager
        "Mod+W".action.spawn = "zen"; # Browser
        "Mod+T".action.spawn = "Telegram"; # Telegram
        "Mod+M".action.spawn = "yandex-music"; # Telegram
        "Mod+Shift+C".action.spawn = [ "hyprpicker" "-a" ]; # Color Picker
        "Mod+Shift+V".action.spawn =
          [ "noctalia-shell" "ipc" "call" "launcher" "clipboard" ];

        # DMS / Shell
        "Mod+Space".action.spawn =
          [ "noctalia-shell" "ipc" "call" "launcher" "toggle" ];
        "Mod+Shift+L".action.spawn =
          [ "noctalia-shell" "ipc" "call" "lockScreen" "lock" ];
      };

    };
  };
}
