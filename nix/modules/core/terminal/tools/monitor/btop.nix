{ lib, ... }:
{
  metadata = {
    name = "btop";
    description = "Module for `core.terminal.tools.monitor.btop`.";
    purpose = "Configure `core.terminal.tools.monitor.btop` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "core"
      "terminal"
      "tools"
      "monitor"
    ];
  };

  home =
    {
      cfg,
      ...
    }:
    {
      programs.btop = lib.mkIf cfg.enable {
        enable = true;
        settings = {
          theme_background = false;
          vim_keys = true;
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable btop";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
