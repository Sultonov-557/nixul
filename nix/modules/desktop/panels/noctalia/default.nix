{ config, inputs, ... }:
{
  home-manager.users.${config.nixul.user} = {

    imports = [
      inputs.noctalia.homeModules.default
      ./plugins.nix
      ./settings/bar.nix
      ./settings/control-center.nix
      ./settings/general.nix
      ./settings/launcher.nix
      ./settings/locale.nix
      ./settings/notifications.nix
      ./settings/system-monitor.nix
      ./settings/ui.nix
    ];

    programs.noctalia-shell = {
      enable = true;
      systemd.enable = true;
    };
  };
}
