{ lib, ... }:
{
  home =
    { cfg, nixul, ... }:
    {
      programs.opencode = lib.mkIf cfg.enable (
        let
          palette = nixul.theme.colors.palette;
        in
        {
          enable = true;

          settings = {
            theme = "nixul";
            plugin = [
              "opencode-antigravity-auth@latest"
              "opencode-openai-codex-auth@latest"
            ];
            permission = {
              bash = "ask";
              edit = "ask";
              read = "allow";
              grep = "allow";
              glob = "allow";
              list = "allow";
              lsp = "allow";
              skill = "ask";
              todowrite = "allow";
              todoread = "allow";
              webfetch = "allow";
              question = "allow";
            };
          };

          themes.nixul = {
            theme = {
              accent = {
                dark = "#${palette.base0F}";
                light = "#${palette.base07}";
              };
              background = {
                dark = "#${palette.base00}";
                light = "#${palette.base06}";
              };
              backgroundElement = {
                dark = "#${palette.base01}";
                light = "#${palette.base04}";
              };
              backgroundPanel = {
                dark = "#${palette.base01}";
                light = "#${palette.base05}";
              };
              border = {
                dark = "#${palette.base02}";
                light = "#${palette.base03}";
              };
              borderActive = {
                dark = "#${palette.base03}";
                light = "#${palette.base02}";
              };
              borderSubtle = {
                dark = "#${palette.base02}";
                light = "#${palette.base03}";
              };
              diffAdded = {
                dark = "#${palette.base0B}";
                light = "#${palette.base0B}";
              };
              diffAddedBg = {
                dark = "#${palette.base01}";
                light = "#${palette.base05}";
              };
              diffAddedLineNumberBg = {
                dark = "#${palette.base01}";
                light = "#${palette.base05}";
              };
              diffContext = {
                dark = "#${palette.base03}";
                light = "#${palette.base03}";
              };
              diffContextBg = {
                dark = "#${palette.base01}";
                light = "#${palette.base05}";
              };
              diffHighlightAdded = {
                dark = "#${palette.base0B}";
                light = "#${palette.base0B}";
              };
              diffHighlightRemoved = {
                dark = "#${palette.base08}";
                light = "#${palette.base08}";
              };
              diffHunkHeader = {
                dark = "#${palette.base03}";
                light = "#${palette.base03}";
              };
              diffLineNumber = {
                dark = "#${palette.base03}";
                light = "#${palette.base04}";
              };
              diffRemoved = {
                dark = "#${palette.base08}";
                light = "#${palette.base08}";
              };
              diffRemovedBg = {
                dark = "#${palette.base01}";
                light = "#${palette.base05}";
              };
              diffRemovedLineNumberBg = {
                dark = "#${palette.base01}";
                light = "#${palette.base05}";
              };
              error = {
                dark = "#${palette.base08}";
                light = "#${palette.base08}";
              };
              info = {
                dark = "#${palette.base0C}";
                light = "#${palette.base0F}";
              };
              markdownBlockQuote = {
                dark = "#${palette.base03}";
                light = "#${palette.base01}";
              };
              markdownCode = {
                dark = "#${palette.base0B}";
                light = "#${palette.base0B}";
              };
              markdownCodeBlock = {
                dark = "#${palette.base01}";
                light = "#${palette.base00}";
              };
              markdownEmph = {
                dark = "#${palette.base0A}";
                light = "#${palette.base09}";
              };
              markdownHeading = {
                dark = "#${palette.base0E}";
                light = "#${palette.base0F}";
              };
              markdownHorizontalRule = {
                dark = "#${palette.base04}";
                light = "#${palette.base03}";
              };
              markdownImage = {
                dark = "#${palette.base0D}";
                light = "#${palette.base0D}";
              };
              markdownImageText = {
                dark = "#${palette.base0C}";
                light = "#${palette.base07}";
              };
              markdownLink = {
                dark = "#${palette.base0D}";
                light = "#${palette.base0D}";
              };
              markdownLinkText = {
                dark = "#${palette.base0C}";
                light = "#${palette.base07}";
              };
              markdownListEnumeration = {
                dark = "#${palette.base0C}";
                light = "#${palette.base07}";
              };
              markdownListItem = {
                dark = "#${palette.base0D}";
                light = "#${palette.base0F}";
              };
              markdownStrong = {
                dark = "#${palette.base09}";
                light = "#${palette.base0A}";
              };
              markdownText = {
                dark = "#${palette.base05}";
                light = "#${palette.base00}";
              };
              primary = {
                dark = "#${palette.base0D}";
                light = "#${palette.base0F}";
              };
              secondary = {
                dark = "#${palette.base0E}";
                light = "#${palette.base0D}";
              };
              success = {
                dark = "#${palette.base0B}";
                light = "#${palette.base0B}";
              };
              syntaxComment = {
                dark = "#${palette.base04}";
                light = "#${palette.base03}";
              };
              syntaxFunction = {
                dark = "#${palette.base0D}";
                light = "#${palette.base0C}";
              };
              syntaxKeyword = {
                dark = "#${palette.base0E}";
                light = "#${palette.base0D}";
              };
              syntaxNumber = {
                dark = "#${palette.base09}";
                light = "#${palette.base0E}";
              };
              syntaxOperator = {
                dark = "#${palette.base0C}";
                light = "#${palette.base0D}";
              };
              syntaxPunctuation = {
                dark = "#${palette.base05}";
                light = "#${palette.base00}";
              };
              syntaxString = {
                dark = "#${palette.base0B}";
                light = "#${palette.base0B}";
              };
              syntaxType = {
                dark = "#${palette.base0A}";
                light = "#${palette.base07}";
              };
              syntaxVariable = {
                dark = "#${palette.base07}";
                light = "#${palette.base07}";
              };
              text = {
                dark = "#${palette.base05}";
                light = "#${palette.base00}";
              };
              textMuted = {
                dark = "#${palette.base04}";
                light = "#${palette.base01}";
              };
              warning = {
                dark = "#${palette.base0A}";
                light = "#${palette.base0A}";
              };
            };
          };
        }
      );
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable opencode";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
