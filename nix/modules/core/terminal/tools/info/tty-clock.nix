{ lib, pkgs, ... }:
{
  metadata = {
    name = "tty-clock";
    description = "Module for `core.terminal.tools.info.tty-clock`.";
    purpose = "Configure `core.terminal.tools.info.tty-clock` features and defaults.";
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
          tty-clock
        ]
      );
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable tty-clock";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
