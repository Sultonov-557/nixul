{ lib, config, ... }:
{
  home =
    {
      cfg,
      inputs,
      nixul,
      ...
    }:
    {
      imports = [
        inputs.caelestia-shell.homeManagerModules.default
        ./bar.nix
        ./launcher.nix
        ./appearance.nix
      ];

      programs.caelestia = lib.mkIf cfg.enable {
        enable = true;
        systemd.enable = true;

        settings = {
          services.weatherLocation = config.nixul.host.location;
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
