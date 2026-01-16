{ config, ... }: {
  programs.niri = {
    enable = true;
    settings = {
      enable = true;

      binds = with config.lib.niri.actions; {
        # -- Applications --
        "Mod+Return".action.spawn = "ghostty";
        "Mod+E".action.spawn = "nautilus"; # File Manager
        "Mod+W".action.spawn = "zen"; # Browser
        "Mod+T".action.spawn = "Telegram"; # Telegram
        "Mod+M".action.spawn = "yandex-music"; # Telegram
        "Mod+Shift+C".action.spawn = [ "hyprpicker" "-a" ]; # Color Picker
        "Mod+Shift+V".action.spawn = "dms ipc call clipboard toggle";

        # DMS / Shell
        "Mod+Space".action.spawn = [ "dms" "ipc" "call" "spotlight" "toggle" ];
        "Mod+Shift+L".action.spawn = [ "dms" "ipc" "call" "lock" "lock" ];
      };

    };
  };
}
