{ lib, pkgs, ... }:
{
  metadata = {
    name = "chrome";
    description = "Module for `apps.user.internet.browsers.chrome`.";
    purpose = "Configure `apps.user.internet.browsers.chrome` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "user"
      "internet"
      "browsers"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ google-chrome ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable google-chrome";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
