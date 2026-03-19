{ lib, ... }:
{
  metadata = {
    name = "lutris";
    description = "Module for `apps.gaming.platform.lutris`.";
    purpose = "Configure `apps.gaming.platform.lutris` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "apps"
      "gaming"
      "platform"
      "lutris"
    ];
  };

  home =
    { cfg, ... }:
    {
      programs.lutris.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable lutris";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
