{ lib, ... }:
{
  metadata = {
    name = "rtkit";
    description = "Module for `hardware.audio.rtkit`.";
    purpose = "Configure `hardware.audio.rtkit` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "audio"
      "rtkit"
    ];
  };

  system =
    { cfg, ... }:
    {
      security.rtkit.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable rtkit";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
