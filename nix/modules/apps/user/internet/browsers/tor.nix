{ lib, pkgs, ... }:
{
  metadata = {
    name = "tor";
    description = "Module for `apps.user.internet.browsers.tor`.";
    purpose = "Configure `apps.user.internet.browsers.tor` features and defaults.";
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
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ tor-browser ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable tor-browser";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
