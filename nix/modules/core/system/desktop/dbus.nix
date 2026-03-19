{ lib, ... }:
{
  metadata = {
    name = "dbus";
    description = "Module for `core.system.desktop.dbus`.";
    purpose = "Configure `core.system.desktop.dbus` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "system"
      "desktop"
      "dbus"
    ];
  };

  system =
    { cfg, ... }:
    {
      services.dbus.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable dbus";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
