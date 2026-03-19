{ lib, ... }:
{
  metadata = {
    name = "gamemode";
    description = "Module for `apps.gaming.platform.gamemode`.";
    purpose = "Configure `apps.gaming.platform.gamemode` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "gaming"
      "platform"
      "gamemode"
    ];
  };

  system =
    { cfg, ... }:
    {
      programs.gamemode.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable gamemode";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
