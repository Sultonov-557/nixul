{ lib, ... }:
{
  metadata = {
    name = "polkit";
    description = "Module for `core.security.access.polkit`.";
    purpose = "Configure `core.security.access.polkit` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "security"
      "access"
      "polkit"
    ];
  };

  system =
    { cfg, ... }:
    {
      security.polkit.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable polkit";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
