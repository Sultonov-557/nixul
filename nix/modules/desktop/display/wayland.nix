{ lib, ... }:
{
  metadata = {
    name = "wayland";
    description = "Module for `desktop.display.wayland`.";
    purpose = "Configure `desktop.display.wayland` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "desktop"
      "display"
      "wayland"
    ];
  };

  system =
    { cfg, ... }:
    {
      programs.xwayland.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable wayland";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
