{ lib, ... }:
{
  metadata = {
    name = "eza";
    description = "Module for `core.terminal.tools.display.eza`.";
    purpose = "Configure `core.terminal.tools.display.eza` features and defaults.";
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
      programs.eza.enable = lib.mkIf cfg.enable true;
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable eza";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
