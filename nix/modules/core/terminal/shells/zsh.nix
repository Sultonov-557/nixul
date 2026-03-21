{ lib, config, ... }:
{
  system =
    { cfg, ... }:
    {
      programs.zsh = lib.mkIf cfg.enable { enable = true; };
    };

  home =
    { cfg, ... }:
    let
      aliasesAdapter = import ../../../lib/aliases.nix { inherit lib; };
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
    };}
