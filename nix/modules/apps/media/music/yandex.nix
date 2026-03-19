{ lib, pkgs, ... }:
{
  metadata = {
    name = "yandex";
    description = "Module for `apps.media.music.yandex`.";
    purpose = "Configure `apps.media.music.yandex` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "apps"
      "media"
      "music"
      "yandex"
    ];
  };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ yandex-music ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable yandex-music";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
