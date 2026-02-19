{
  meta = {
    scope = "user";
    hm = true;
    system = false;
  };

  home =
    {
      cfg, # TODO: add config
      inputs,
      config,
      ...
    }:
    {
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
          services.weatherLocation = config.nixul.location;
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
