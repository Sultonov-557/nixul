{ lib, ... }:
{
  metadata = {
    name = "thefuck";
    description = "Module for `core.terminal.tools.history.thefuck`.";
    purpose = "Configure `core.terminal.tools.history.thefuck` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "core"
      "terminal"
      "tools"
      "history"
    ];
  };

  home =
    { cfg, ... }:
    {
      programs.pay-respects = lib.mkIf cfg.enable {
        enable = true;
        options = [
          "--alias"
          "f"
        ];
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
          description = "Enable thefuck (pay-respects)";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
