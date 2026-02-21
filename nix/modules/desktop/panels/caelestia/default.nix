{ lib, config, ... }:
{
  home =
    { cfg, inputs, ... }:
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

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable caelestia";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
