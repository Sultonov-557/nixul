{ lib, ... }:
{
  metadata = {
    name = "steam";
    description = "Module for `apps.gaming.platform.steam`.";
    purpose = "Configure `apps.gaming.platform.steam` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "gaming"
      "platform"
      "steam"
    ];
  };

  system =
    { cfg, ... }:
    {
      programs.steam.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable steam";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
