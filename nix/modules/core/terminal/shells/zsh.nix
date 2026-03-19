{ lib, config, ... }:
{
  metadata = {
    name = "zsh";
    description = "Module for `core.terminal.shells.zsh`.";
    purpose = "Configure `core.terminal.shells.zsh` features and defaults.";
    scope = "shared";
    status = "active";
    tags = [
      "core"
      "terminal"
      "shells"
      "zsh"
    ];
  };

  system =
    { cfg, ... }:
    {
      programs.zsh = lib.mkIf cfg.enable { enable = true; };
    };

  home =
    { cfg, ... }:
    let
      aliasesAdapter = import ../../../../nixul/universal/aliases/adapters/default.nix { inherit lib; };
      universalAliases = aliasesAdapter.mkAliases config.nixul.aliases;
    in
    {
      programs.zsh = lib.mkIf cfg.enable {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        oh-my-zsh = {
          enable = true;
          plugins = [
            "git"
            "sudo"
            "docker"
            "kubectl"
            "aliases"
            "bun"
            "history-substring-search"
            "colored-man-pages"
          ];
          theme = "robbyrussell";
        };

        shellAliases = universalAliases;

        initContent = ''
          eval "$(zoxide init zsh)"
        '';
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable zsh";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
