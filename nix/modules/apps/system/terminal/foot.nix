{ lib, ... }:
{
  home =
    { cfg, config, ... }:
    let
      palette = config.nixul.theme.colors.palette;
    in
    {
      programs.foot = lib.mkIf cfg.enable {
        enable = true;
        settings = {
          main = {
            font = "${config.nixul.theme.fonts.monospace.name}:size=${toString config.nixul.theme.fonts.monospace.size}";
          };
          cursor = {
            style = "block";
            blink = "yes";
            color = "${palette.base00} ${palette.base05}";
          };
          colors = {
            background = palette.base00;
            foreground = palette.base05;
            regular0 = palette.base00;
            regular1 = palette.base08;
            regular2 = palette.base0B;
            regular3 = palette.base0A;
            regular4 = palette.base0D;
            regular5 = palette.base0E;
            regular6 = palette.base0C;
            regular7 = palette.base05;
            bright0 = palette.base03;
            bright1 = palette.base08;
            bright2 = palette.base0B;
            bright3 = palette.base0A;
            bright4 = palette.base0D;
            bright5 = palette.base0E;
            bright6 = palette.base0C;
            bright7 = palette.base07;
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
          description = "Enable foot";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
