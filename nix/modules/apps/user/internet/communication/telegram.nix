{ lib, pkgs, ... }:
{
  metadata = {
    name = "telegram";
    description = "Module for `apps.user.internet.communication.telegram`.";
    purpose = "Configure `apps.user.internet.communication.telegram` features and defaults.";
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
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ telegram-desktop ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable telegram";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
