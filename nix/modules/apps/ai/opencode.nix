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
