{ inputs, config, ... }:
{
  home-manager.users.${config.nixul.user} = {
    imports = [
      inputs.caelestia-shell.homeManagerModules.default
      ./bar.nix
      ./launcher.nix
      ./appearance.nix
    ];

    programs.caelestia = {
      enable = true;
      systemd.enable = true;
      settings = {
        services.weatherLocation = "Paris"; # TODO : nixul option for this
        general = {
          apps = {
            terminal = [ "ghostty" ];
            audio = [ "pavucontrol" ];
            explorer = [ "thunar" ];
          };
          idle = {
            timeouts = [ ];
          };
        };
      };
      cli = {
        enable = true;
      };
    };
  };
}
