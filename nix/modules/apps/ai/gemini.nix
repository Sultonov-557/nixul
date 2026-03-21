{ lib, ... }:
{

  home =
    { cfg, nixul, ... }:
    {
      programs.gemini-cli = lib.mkIf cfg.enable {
        enable = true;
        settings =
          let
            palette = nixul.theme.colors.palette;
          in
          {
            ui = {
              primary_color = "#${palette.base0D}";
              secondary_color = "#${palette.base0E}";
              error_color = "#${palette.base08}";
              success_color = "#${palette.base0B}";
            };
          };
      };
    };}
