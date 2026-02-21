{ lib, inputs, ... }:
{
  home =
    { cfg, ... }:
    {
      imports = [
        inputs.noctalia.homeModules.default
        ./plugins.nix
        ./settings/audio.nix
        ./settings/bar.nix
        ./settings/brightness.nix
        ./settings/control-center.nix
        ./settings/desktop-widgets.nix
        ./settings/dock.nix
        ./settings/general.nix
        ./settings/hooks.nix
        ./settings/launcher.nix
        ./settings/locale.nix
        ./settings/network.nix
        ./settings/night-light.nix
        ./settings/notifications.nix
        ./settings/osd.nix
        ./settings/session-menu.nix
        ./settings/system-monitor.nix
        ./settings/templates.nix
        ./settings/ui.nix
        ./settings/wallpaper.nix
      ];

      programs.noctalia-shell = lib.mkIf cfg.enable {
        enable = true;
        systemd.enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable noctalia";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
