{ lib, ... }:
{
  metadata = {
    name = "fzf";
    description = "Module for `core.terminal.tools.navigation.fzf`.";
    purpose = "Configure `core.terminal.tools.navigation.fzf` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "core"
      "terminal"
      "tools"
      "navigation"
    ];
  };

  home =
    { cfg, ... }:
    {
      programs.fzf = lib.mkIf cfg.enable {
        enable = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable fzf";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
