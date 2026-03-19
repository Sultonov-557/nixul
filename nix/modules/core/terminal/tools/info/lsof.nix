{ lib, pkgs, ... }:
{
  metadata = {
    name = "lsof";
    description = "Module for `core.terminal.tools.info.lsof`.";
    purpose = "Configure `core.terminal.tools.info.lsof` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "core"
      "terminal"
      "tools"
      "info"
    ];
  };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (
        with pkgs;
        [
          lsof
        ]
      );
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable lsof";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
