{ lib, ... }:
{
  metadata = {
    name = "fail2ban";
    description = "Module for `core.security.access.fail2ban`.";
    purpose = "Configure `core.security.access.fail2ban` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "core"
      "security"
      "access"
      "fail2ban"
    ];
  };

  system =
    { cfg, ... }:
    {
      services.fail2ban = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable fail2ban";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
