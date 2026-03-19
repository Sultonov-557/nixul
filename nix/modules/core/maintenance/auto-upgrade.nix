{ lib, ... }:
{
  metadata = {
    name = "auto-upgrade";
    description = "Module for `core.maintenance.auto-upgrade`.";
    purpose = "Configure `core.maintenance.auto-upgrade` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "maintenance"
      "auto-upgrade"
    ];
  };

  system =
    { cfg, ... }:
    {
      system.autoUpgrade = lib.mkIf cfg.enable {
        enable = true;
        dates = "daily";
        upgrade = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable auto-upgrade";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
