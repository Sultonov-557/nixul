{ lib, ... }:
{
  system =
    { cfg, nixul, ... }:
    {
      services.displayManager.gdm.enable = lib.mkIf cfg.enable true;

      programs.dconf.profiles.gdm.databases = lib.mkIf cfg.enable [
        {
          settings = {
            "org/gnome/desktop/interface" = {
              cursor-theme = nixul.theme.cursor.name;
              icon-theme = nixul.theme.icons.name;
            };
          };
        }
      ];
    };}
