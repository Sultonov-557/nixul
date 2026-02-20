{ inputs }:
{
  meta = {
    scope = "user";
    hm = true;
    system = false;
  };

  home =
    { ... }:
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

      programs.noctalia-shell = {
        enable = true;
        systemd.enable = true;
      };
    };
}
