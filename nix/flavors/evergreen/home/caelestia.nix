{ inputs, ... }:
{
  imports = [ inputs.caelestia-shell.homeManagerModules.default ];

  programs.caelestia = {
    enable = true;

    systemd = {
      enable = true;
      target = "graphical-session.target";
    };

    settings = {
      paths = {
        wallpaperDir = ../assets;
      };
    };

    cli = {
      enable = true;
      settings = {
        theme = {
          enableGtk = true;
        };
      };
    };
  };
}
