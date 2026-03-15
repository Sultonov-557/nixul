{ lib, ... }:
{
  home =
    {
      cfg,
      ...
    }:
    {
      programs.fastfetch = lib.mkIf cfg.enable {
        enable = true;

        settings = {
          display = {
            color = {
              keys = "magenta";
              title = "magenta";
            };
          };
          modules = [
            "title"
            "separator"
            "os"
            "host"
            "kernel"
            "uptime"
            "packages"
            "shell"
            "display"
            "de"
            "wm"
            "wmtheme"
            "theme"
            "icons"
            "font"
            "cursor"
            "terminal"
            "terminalfont"
            "cpu"
            "gpu"
            "memory"
            "disk"
            "localip"
            "battery"
            "poweradapter"
            "locale"
            "break"
            "colors"
          ];
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable fastfetch";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
