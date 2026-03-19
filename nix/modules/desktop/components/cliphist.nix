{ lib, pkgs, ... }:
{
  metadata = {
    name = "cliphist";
    description = "Module for `desktop.components.cliphist`.";
    purpose = "Configure `desktop.components.cliphist` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "desktop"
      "components"
      "cliphist"
    ];
  };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable [
        pkgs.cliphist
        pkgs.wl-clipboard
      ];

      services.cliphist.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable cliphist";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
