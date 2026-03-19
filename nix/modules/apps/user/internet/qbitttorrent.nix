{ lib, pkgs, ... }:
{
  metadata = {
    name = "qbitttorrent";
    description = "Module for `apps.user.internet.qbitttorrent`.";
    purpose = "Configure `apps.user.internet.qbitttorrent` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "user"
      "internet"
      "qbitttorrent"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ qbittorrent ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable qbittorrent";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
