{ lib, ... }:
{
  metadata = {
    name = "foot";
    description = "Module for `apps.system.terminal.foot`.";
    purpose = "Configure `apps.system.terminal.foot` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "apps"
      "system"
      "terminal"
      "foot"
    ];
  };

  home =
    { cfg, osConfig, ... }:
    let
      palette = osConfig.nixul.theme.colors.palette;
    in
    {
      programs.foot = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable foot";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
