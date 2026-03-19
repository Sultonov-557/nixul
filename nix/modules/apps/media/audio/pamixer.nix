{ lib, pkgs, ... }:
{
  metadata = {
    name = "pamixer";
    description = "Module for `apps.media.audio.pamixer`.";
    purpose = "Configure `apps.media.audio.pamixer` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "media"
      "audio"
      "pamixer"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ pamixer ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable pamixer";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
