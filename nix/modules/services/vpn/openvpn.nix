{ lib, pkgs, ... }:
{
  metadata = {
    name = "openvpn";
    description = "Module for `services.vpn.openvpn`.";
    purpose = "Configure `services.vpn.openvpn` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "services"
      "vpn"
      "openvpn"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ openvpn ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable openvpn";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
