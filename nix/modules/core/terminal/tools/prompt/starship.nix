{ lib, ... }:
{
  metadata = {
    name = "starship";
    description = "Module for `core.terminal.tools.prompt.starship`.";
    purpose = "Configure `core.terminal.tools.prompt.starship` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "core"
      "terminal"
      "tools"
      "prompt"
    ];
  };

  home =
    {
      cfg,
      osConfig,
      ...
    }:
    let
      palette = osConfig.nixul.theme.colors.palette;
    in
    {
      programs.starship = lib.mkIf cfg.enable {
        enable = true;
        enableZshIntegration = true;
        settings = {
          add_newline = false;
          character = {
            success_symbol = "[➜](bold #${palette.base0B})";
            error_symbol = "[➜](bold #${palette.base08})";
          };
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable starship";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
