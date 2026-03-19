{ lib, ... }:
{
  metadata = {
    name = "acme";
    description = "Module for `core.security.network.acme`.";
    purpose = "Configure `core.security.network.acme` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "security"
      "network"
      "acme"
    ];
  };

  system =
    { cfg, config, ... }:
    {
      security.acme = lib.mkIf cfg.enable {
        acceptTerms = true;
        defaults = {
          email = config.nixul.users.${config.nixul.primaryUser}.email;
          dnsResolver = "1.1.1.1";
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable acme";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
