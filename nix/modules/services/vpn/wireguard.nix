{ lib, ... }:
{
  metadata = {
    name = "wireguard";
    description = "Module for `services.vpn.wireguard`.";
    purpose = "Configure `services.vpn.wireguard` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "services"
      "vpn"
      "wireguard"
    ];
  };

  system =
    { cfg, ... }:
    {
      networking.wireguard.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable wireguard";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
