{ lib, ... }:
{
  metadata = {
    name = "zoxide";
    description = "Module for `core.terminal.tools.navigation.zoxide`.";
    purpose = "Configure `core.terminal.tools.navigation.zoxide` features and defaults.";
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
      programs.zoxide = lib.mkIf cfg.enable {
        enable = true;
        enableBashIntegration = true;
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
          description = "Enable zoxide";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
