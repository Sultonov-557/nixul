{ lib, pkgs, ... }:
{
  metadata = {
    name = "yazi";
    description = "Module for `apps.system.files.managers.yazi`.";
    purpose = "Configure `apps.system.files.managers.yazi` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "apps"
      "system"
      "files"
      "managers"
    ];
  };

  home =
    { cfg, ... }:
    {
      programs.yazi.enable = lib.mkIf cfg.enable true;
      home.packages = lib.mkIf cfg.enable (
        with pkgs;
        [
          yazi
          ueberzugpp
        ]
      );
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable yazi";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
