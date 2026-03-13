{ lib, ... }:
{

  home =
    { cfg, nixul, ... }:
    {
      programs.codex = lib.mkIf cfg.enable {
        enable = true;
        custom-instructions = cfg.instructions or "";

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

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable codex";
        };
        instructions = lib.mkOption {
          type = lib.types.str;
          default = "";
          description = "Custom instructions for codex";
        };
      };
    };
    default = {
      enable = false;
    };
  };

}
