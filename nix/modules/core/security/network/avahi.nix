{ lib, ... }:
{
  metadata = {
    name = "avahi";
    description = "Module for `core.security.network.avahi`.";
    purpose = "Configure `core.security.network.avahi` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "security"
      "network"
      "avahi"
    ];
  };

  system =
    { cfg, ... }:
    {
      services.avahi = lib.mkIf cfg.enable {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable avahi";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
