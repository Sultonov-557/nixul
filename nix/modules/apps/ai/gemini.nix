{ lib, ... }:
{
  metadata = {
    name = "gemini";
    description = "Module for `apps.ai.gemini`.";
    purpose = "Configure `apps.ai.gemini` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "apps"
      "ai"
      "gemini"
    ];
  };


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
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable gemini";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
