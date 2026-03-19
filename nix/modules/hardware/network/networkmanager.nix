{ lib, ... }:
{
  metadata = {
    name = "networkmanager";
    description = "Module for `hardware.network.networkmanager`.";
    purpose = "Configure `hardware.network.networkmanager` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "hardware"
      "network"
      "networkmanager"
    ];
  };

  system =
    { cfg, config, ... }:
    {
      networking.networkmanager.enable = lib.mkIf cfg.enable true;
      networking.hostName = lib.mkIf cfg.enable config.nixul.host.name;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable networkmanager";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
