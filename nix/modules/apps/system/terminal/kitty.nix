{ lib, ... }:
{
  home =
    { cfg, ... }:
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
