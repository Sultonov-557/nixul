{ lib, pkgs, ... }:
{
  metadata = {
    name = "pulsemixer";
    description = "Module for `apps.media.audio.pulsemixer`.";
    purpose = "Configure `apps.media.audio.pulsemixer` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "media"
      "audio"
      "pulsemixer"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ pulsemixer ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable pulsemixer";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
