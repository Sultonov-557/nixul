{ lib, ... }:
{
  metadata = {
    name = "firewall";
    description = "Module for `core.security.network.firewall`.";
    purpose = "Configure `core.security.network.firewall` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "security"
      "network"
      "firewall"
    ];
  };

  system =
    { cfg, ... }:
    {
      networking.firewall = lib.mkIf cfg.enable {
        enable = true;
        allowedTCPPorts = [
          22
          80
          443
        ];
        allowedUDPPorts = [ ];
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable firewall";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
