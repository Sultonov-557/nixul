{ lib, ... }:
{

  home =
    { cfg, nixul, ... }:
    {
      programs.codex = lib.mkIf cfg.enable {
        enable = true;
        custom-instructions = "";

        settings =
          let
            palette = nixul.theme.colors.palette;
          in
          {
            prompt_color = "#${palette.base05}";
            highlight_color = "#${palette.base0D}";
          };
      };
    };
}
