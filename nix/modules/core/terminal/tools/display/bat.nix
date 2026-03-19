{ lib, ... }:
{
  metadata = {
    name = "bat";
    description = "Module for `core.terminal.tools.display.bat`.";
    purpose = "Configure `core.terminal.tools.display.bat` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "core"
      "terminal"
      "tools"
      "display"
    ];
  };

  home =
    { cfg, ... }:
    {
      programs.bat = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable bat";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
