{ lib, ... }:
{
  home =
    {
      cfg,
      inputs,
      nixul,
      ...
    }:
    {
      imports = [ inputs.nixcord.homeModules.nixcord ];

      programs.nixcord = lib.mkIf cfg.enable {
        enable = true;
        config = {
          useQuickCss = true;
        };
        quickCss =
          let
            palette = nixul.theme.colors.palette;
          in
          ''
            :root {
              --brand-experiment: #${palette.base0D};
              --brand-experiment-hover: #${palette.base0E};
              --header-primary: #${palette.base07};
              --header-secondary: #${palette.base05};
              --text-normal: #${palette.base05};
              --text-muted: #${palette.base04};
              --background-primary: #${palette.base00};
              --background-secondary: #${palette.base01};
              --background-secondary-alt: #${palette.base01};
              --background-tertiary: #${palette.base00};
              --background-accent: #${palette.base02};
              --background-floating: #${palette.base00};
              --background-modifier-selected: #${palette.base02};
            }
          '';
      };
    };}
