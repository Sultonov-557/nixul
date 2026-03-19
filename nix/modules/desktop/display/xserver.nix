{ lib, ... }:
{
  metadata = {
    name = "xserver";
    description = "Module for `desktop.display.xserver`.";
    purpose = "Configure `desktop.display.xserver` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "desktop"
      "display"
      "xserver"
    ];
  };

  system =
    { cfg, ... }:
    {
      services.xserver.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable xserver";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
