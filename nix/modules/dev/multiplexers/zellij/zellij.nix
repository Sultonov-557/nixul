{ lib, ... }:
{
  home =
    { cfg, osConfig, ... }:
    {
      programs.zellij = lib.mkIf cfg.enable {
        enable = true;

        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;

        attachExistingSession = true;
      };

      xdg.configFile."zellij/config.kdl".source = ./zellij.kdl;
      xdg.configFile."zellij/themes/nixul.kdl".text =
        let
          palette = osConfig.nixul.theme.colors.palette;
        in
        ''
          themes {
            nixul {
              fg "#${palette.base05}"
              bg "#${palette.base00}"
              black "#${palette.base00}"
              red "#${palette.base08}"
              green "#${palette.base0B}"
              yellow "#${palette.base0A}"
              blue "#${palette.base0D}"
              magenta "#${palette.base0E}"
              cyan "#${palette.base0C}"
              white "#${palette.base05}"
              orange "#${palette.base09}"
            }
          }
        '';
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable zellij";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
