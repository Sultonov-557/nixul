{ lib, ... }:
{
  metadata = {
    name = "thunderbird";
    description = "Module for `apps.user.internet.communication.thunderbird`.";
    purpose = "Configure `apps.user.internet.communication.thunderbird` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "user"
      "internet"
      "communication"
    ];
  };

  system =
    { cfg, ... }:
    {
      programs.thunderbird = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable thunderbird";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
