{ lib, ... }:
{
  metadata = {
    name = "gamescope";
    description = "Module for `apps.gaming.platform.gamescope`.";
    purpose = "Configure `apps.gaming.platform.gamescope` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "gaming"
      "platform"
      "gamescope"
    ];
  };

  system =
    { cfg, ... }:
    {
      programs.gamescope.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable gamescope";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
