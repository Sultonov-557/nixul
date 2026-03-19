{ lib, pkgs, ... }:
{
  metadata = {
    name = "polkit";
    description = "Module for `desktop.components.polkit`.";
    purpose = "Configure `desktop.components.polkit` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "desktop"
      "components"
      "polkit"
    ];
  };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable [ pkgs.lxqt.lxqt-policykit ];
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
