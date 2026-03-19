{ lib, pkgs, ... }:
{
  metadata = {
    name = "pavucontrol";
    description = "Module for `apps.media.audio.pavucontrol`.";
    purpose = "Configure `apps.media.audio.pavucontrol` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "apps"
      "media"
      "audio"
      "pavucontrol"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ pavucontrol ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable pavucontrol";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
