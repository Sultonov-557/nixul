{ lib, ... }:
{
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
    };}
