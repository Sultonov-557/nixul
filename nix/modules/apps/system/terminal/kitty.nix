{ lib, ... }:
{
  metadata = {
    name = "kitty";
    description = "Module for `apps.system.terminal.kitty`.";
    purpose = "Configure `apps.system.terminal.kitty` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "apps"
      "system"
      "terminal"
      "kitty"
    ];
  };

  home =
    { cfg, osConfig, ... }:
    let
      palette = osConfig.nixul.theme.colors.palette;
    in
    {
      programs.kitty = lib.mkIf cfg.enable {
        enable = true;
        shellIntegration = {
          enableZshIntegration = true;
          enableFishIntegration = true;
        };

        settings = {
          enable_audio_bell = false;
          confirm_os_window_close = 0;
        };

        keybindings = {
          "Ctrl+Shift+T" = "";
          "Ctrl+Shift+W" = "";
          "Ctrl+Shift+Left" = "";
          "Ctrl+Shift+Right" = "";
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable kitty";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
