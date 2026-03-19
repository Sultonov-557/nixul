{ lib, ... }:
{
  metadata = {
    name = "gdm";
    description = "Module for `desktop.display-manager.gdm`.";
    purpose = "Configure `desktop.display-manager.gdm` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "desktop"
      "display-manager"
      "gdm"
    ];
  };

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
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable gdm";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
